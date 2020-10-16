package com.proj.yollowa.model.service.host;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.host.ActivityOptionVo;
import com.proj.yollowa.model.entity.host.ActivityUpdatePageDto;
import com.proj.yollowa.model.entity.host.ActivityVo;
import com.proj.yollowa.model.entity.host.AddActivityPageDto;
import com.proj.yollowa.model.entity.host.LodgementVo;
import com.proj.yollowa.model.entity.host.RoomInfoVo;
import com.proj.yollowa.model.host.HostDao;

@Service
public class HostActivityServiceImpl implements HostActivityService{

	@Inject
	SqlSession sqlSession;
	
/*  host/activity start **********************************************************************************************************/
	// 내가 작성한 액티비티 글 페이지 host/activity
	@Override
	public void selectHostActivityList(Model model, UserVo userVo) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		int user_number = userVo.getUser_number();
		ArrayList<ActivityVo> activityList = hostDao.selectHostActivityList(user_number);
		model.addAttribute("activityList", activityList);
		
//		model.addAttribute("titleImgSize", lodgementList.size());
		// 호스트 인덱스 페이지에서 수정하기 클릭시 이미지
		if(activityList.size()!=0) {
			for(int i=0; i<activityList.size(); i++) {
				
				if(activityList.get(i).getActivity_img().contains("&")) {
					String[] imgs = activityList.get(i).getActivity_img().split("&");
					model.addAttribute("titleImgSize"+i, imgs.length);
					
					for(int j=0; j<imgs.length; j++) {
						model.addAttribute("imgName"+i+j, imgs[j]);
					}
				}
				
			}
			
			// 호스트 인덱스 페이지에서 수정하기 클릭 시 해시태그
			for(int i=0; i<activityList.size(); i++) {
				String[] hashTags = activityList.get(i).getActivity_hashTag().split("&");
				model.addAttribute("hashTagSize"+i, hashTags.length);
				
				for(int j=0; j<hashTags.length; j++) {
					model.addAttribute("hashTag"+i+j, hashTags[j]);
				}
						
			}
		}
	}
	
	// host/activityUpdate/
		@Override
		public void updateHostActivity(int activity_number, ActivityUpdatePageDto bean, HttpServletRequest req) throws IllegalStateException, IOException {
			HostDao hostDao = sqlSession.getMapper(HostDao.class);
			
			// 업데이트 타이틀이미지 업로드
			ArrayList<String> titleImgNames = new ArrayList<String>();
			String img = "";
			for(MultipartFile titleImg : bean.getTitleImg()) {
				String origin = activity_number+"_"+titleImg.getOriginalFilename();
				
				// 이미지 파일 사이에 &로 파싱 : (최종 데이터베이스 전달)
				img+=origin+"&";
				
				if(titleImg.getOriginalFilename().isEmpty()) {
					continue;
				}
				
				String path = "/upload/activity/titleImg/";
				ServletContext context = req.getSession().getServletContext();
				String realPath = context.getRealPath(path);
				
				File dest = new File(realPath+origin);
				System.out.println("이미지 저장위치"+dest.getAbsolutePath());
//				저장위치 /Users/moony/Desktop/yollowa/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/yollowa/upload/activity/titleImg/1601213584288_bigmeet4.jpg
				
				titleImg.transferTo(dest);
				titleImgNames.add(origin);
			}
			String lodgement_img = img.substring(0,img.length()-1);
			// 파일 업로드 후 파싱하여 데이터베이스에 전달하기 위해 set
			bean.setActivity_img(lodgement_img);
			
			// 해시태그 , 로 나눠져있는 것을 & 로 파싱
			String hash = bean.getActivity_hashTag().replaceAll(",", "&");
			bean.setActivity_hashTag(hash);
			
			hostDao.updateHostActivity(activity_number, bean);

		}
		
		// 액티비티 글 삭제
		// host/activityDelete/number
		@Override
		public void deleteHostActivity(int activity_number) {
			HostDao hostDao = sqlSession.getMapper(HostDao.class);
			hostDao.deleteHostActivity(activity_number);
		}
		@Override
		public void deleteHostActivityOption(int activity_number) {
			HostDao hostDao = sqlSession.getMapper(HostDao.class);
			hostDao.deleteHostActivityOption(activity_number);
		}
	
/*  host/activity end **********************************************************************************************************/
	
	
	

/*  host/aadd start **********************************************************************************************************/
	
	// host/ -> 사업자 액티비티글 리스트
	@Override
	public void selectHostLodgementList(Model model, UserVo userVo) {
		
	}
	
	// host/aadd -> Lodgement Insert 액티비티 게시글 정보가 등록 lodgement_img는 제외
	@Override
	public void insertActivity(int user_number, AddActivityPageDto bean) throws SQLException {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		// 해쉬태그
		String activity_hashTag = bean.getActivity_hashTag().replaceAll(",", "&");
		bean.setActivity_hashTag(activity_hashTag);
		
		// 타이틀 이미지
//		String lodgement_img = bean.getLodgement_img().replaceAll(",", "&");
//		bean.setLodgement_img(lodgement_img);
		
		hostDao.insertActivity(user_number, bean);
	}
	
	
	// host/aadd -> 위에서 insert 된 lodgement_number 값을 select (information 테이블에 같이 넣어줘야 하고 titleImg도 파싱해서 넣어줘야 함) 
	@Override
	public int selectActivityNumber(int user_number, AddActivityPageDto bean) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		int activityNumber = hostDao.selectActivityNum(user_number, bean);
		return activityNumber;
	}

	// host/aadd -> 타이틀 이미지들 처리 업로드
	@Override
	public String uploadActivityImg(AddActivityPageDto bean, int activityNumber, HttpServletRequest req)throws SQLException, IllegalStateException, IOException {
		List<String> titleImgNames = new ArrayList<String>();
		
		// lodgement 테이블에 update 시켜주기위해 이미지 파일 사이에 &로 파싱하기 위해 선언
		String img = "";
		
		for(MultipartFile titleImg : bean.getTitleImg()) {
			String origin = activityNumber+"_"+titleImg.getOriginalFilename();
			
			// 이미지 파일 사이에 &로 파싱 : (최종 데이터베이스 전달)
			img+=origin+"&";
			
			if(titleImg.getOriginalFilename().isEmpty()) {
				continue;
			}
			
			String path = "/upload/activity/titleImg/";
			ServletContext context = req.getSession().getServletContext();
			String realPath = context.getRealPath(path);
			
			File dest = new File(realPath+origin);
			System.out.println("숙박 타이틀 이미지 저장위치"+dest.getAbsolutePath());
//			저장위치 /Users/moony/Desktop/yollowa/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/yollowa/upload/lodgement/titleImg/1601213584288_bigmeet4.jpg
			
			titleImg.transferTo(dest);
			titleImgNames.add(origin);
		}
		// 마지막에 붙은 문자 &를 삭제 하고 데이터 전송 
		String lodgement_img = img.substring(0,img.length()-1);
		System.out.println("숙박 타이틀 이미지 파일 사이에 &로 파싱 : (최종 데이터베이스 전달)"+lodgement_img);
		return lodgement_img;
	}

	// host/aadd -> activity_img update
	@Override
	public void updateActivityImg(int activityNumber, String activity_img) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		hostDao.updateActivityImg(activityNumber, activity_img);
	}
	
	// host/aadd -> information insert
	@Override
	public void insertActivityInfo(int activityNumber, AddActivityPageDto bean) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		
		// 공지사항
		if(bean.getInformation_notice().contains(",")) {
			String information_notice = bean.getInformation_notice().replaceAll(",", "&");
			bean.setInformation_notice(information_notice);
		}
		
		// 기본정보
		if(bean.getInformation_basicInfo().contains(",")) {
			String information_basicInfo = bean.getInformation_basicInfo().replaceAll(",", "&");
			bean.setInformation_basicInfo(information_basicInfo);
		}
		
		//인원 추가정보
		if(bean.getInformation_addPeopleInfo().contains(",")) {
			String information_addPeopleInfo = bean.getInformation_addPeopleInfo().replaceAll(",", "&");
			bean.setInformation_addPeopleInfo(information_addPeopleInfo);
		}
		
		// 편의시설 및 서비스
		if(bean.getInformation_service().contains(",")) {
			String information_service = bean.getInformation_service().replaceAll(",", "&");
			bean.setInformation_service(information_service);
		}
		
		// 취소 및 환불규정
		if(bean.getInformation_refundInfo().contains(",")) {
			String information_refundInfo = bean.getInformation_refundInfo().replaceAll(",", "&");
			bean.setInformation_refundInfo(information_refundInfo);
		}
		
		hostDao.insertActivityInfo(activityNumber, bean);
	}
	
/*  host/aadd end **********************************************************************************************************/

	
	
/*  host/activityOptions page start **********************************************************************************************************/
	
	// host/activityOptions -> 유저넘버를 보내 activityOption table에 해당 유저번호로 등록 된 글이 있으면 activity_number return
	@Override
	public ArrayList<ActivityVo> hostNumberMatch(int user_number) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		ArrayList<ActivityVo> matchUserNumber = hostDao.hostActivityNumberMatch(user_number);
		
		if(matchUserNumber.size()!=0) {
			return matchUserNumber;
		}
		return null;
	}
	
	// host/activityOptions -> title select
	@Override
	public void selectActivityName(int activity_number, Model model) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		String activity_title = hostDao.selectActivityName(activity_number);
		model.addAttribute("activity_title", activity_title);
	}
	
	// host/activityOptions -> 등록된 option select
	@Override
	public void selectActivityOptions(int activity_number, Model model) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		ArrayList<ActivityOptionVo> optionList =  hostDao.selectActivityOptions(activity_number);
		model.addAttribute("optionList", optionList);
	}

	// removeOption/{activity_articleNumber}/{activity_optionNumber} -> 액티비티 옵션 삭제
	@Override
	public void deleteOption(int articleNumber, int optionNumber) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		hostDao.deleteOption(articleNumber, optionNumber);
			
	}
	
	// addOption/addOptionAction -> 액티비티 옵션 등록
	@Override
	public void insertActivityOption(ActivityOptionVo optionBean) {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		hostDao.insertActivityOption(optionBean);
	}
	
/*  host/activityOptions page end **********************************************************************************************************/
	
}
