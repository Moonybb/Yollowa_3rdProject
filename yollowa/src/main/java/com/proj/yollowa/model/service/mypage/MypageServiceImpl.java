package com.proj.yollowa.model.service.mypage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.entity.mypage.AReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReviewDto;
import com.proj.yollowa.model.mypage.MypageDao;
@Service
public class MypageServiceImpl implements MypageService{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public UserVo userDetailService(Model model,int user_number) throws SQLException {
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		UserVo userVo = myPageDao.userDetail(user_number);
		
		model.addAttribute("userVo",userVo);
		return userVo;
	}
	//유저 예약 현황
	@Override
	public List lReservationInfoService(Model model, int user_number,String service)
			throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		// 액티비티 일때
		if(service.equals("1")) {
			
			
		}else if(service.equals("2")) {
			List<LReservInfoDto> reservInfo=mypageDao.getLreservationInfo(user_number);
			model.addAttribute("service",service);
			model.addAttribute("rsvinfo",reservInfo);
			return reservInfo;
		}
		
		
		return null;
	}
	//유저 이용내역
	@Override
	public List lUserCompletedInfoService(Model model, int user_number,String service)
			throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		if(service.equals("1")) {
			List<AReservInfoDto> reservInfo=mypageDao.getAreservationInfo(user_number);
			List<Integer> count = new ArrayList<Integer>();
			for(AReservInfoDto dto : reservInfo) {
				count.add(mypageDao.getAExistReview(dto.getaReservInfo_number()));
			}
			System.out.println(count);
			model.addAttribute("existReview",count);
			model.addAttribute("service",service);
			model.addAttribute("usedinfo",reservInfo);
			return reservInfo;
		}else if(service.equals("2")) {
			//숙박일때
			model.addAttribute("service",service);
			List<LReservInfoDto> list=mypageDao.getLuserCompletedInfo(user_number);
			List<Integer> count = new ArrayList<Integer>();
			for(LReservInfoDto dto : list) {
				count.add(mypageDao.getLExistReview(dto.getlReservInfo_number()));
			}
			model.addAttribute("existReview",count);
			model.addAttribute("usedinfo",list);
			return list;
		}
		return null;
	}
	//유저 액티비티 이용내역지난거
	public List<AReservInfoDto> getActivityOverHistory(Model model,int user_number,String service) throws SQLException{
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		
			service="1";
			model.addAttribute("service",service);
			List<AReservInfoDto> list= mypageDao.getOverHistory(user_number);
			List<Integer> count = new ArrayList<Integer>();
			for(AReservInfoDto dto : list) {
				count.add(mypageDao.getAExistReview(dto.getaReservInfo_number()));
			}
			model.addAttribute("existReview",count);
			model.addAttribute("usedinfo",list);
			return list;
	}
	
	//유저 장바구니 목록
	@Override
	public List lUserCartInfoService(Model model, int user_number,String service)
			throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		if(service.equals("1")) {
			List<AReservInfoDto> list=mypageDao.getAuserCartInfo(user_number);
			model.addAttribute("service",service);
			model.addAttribute("cartinfo",list);
			return list;
		}else {
			List<LReservInfoDto> list=mypageDao.getLuserCartInfo(user_number);
			model.addAttribute("service",service);
			model.addAttribute("cartinfo",list);
			return list;
		}
			
	}
	//유저 찜목록
	@Override
	public void userWishListService(Model model, UserVo userVo,String service) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		String aWishList=userVo.getUser_aWishList();
		String lWishList=userVo.getUser_lWishList();
		if(StringUtils.equals("1", service)) {
			
			if(aWishList==null||aWishList.equals("")) {
				model.addAttribute("emptyList","비었습니다.");
				return;
				//찜목록이 여러개이면
			}else if(aWishList.contains("&")) {
				List<ActivityVo> list = new ArrayList<ActivityVo>();
				String[] wishList= aWishList.split("&");
				for(String userWish:wishList) {
					ActivityVo bean = mypageDao.getAwishList(Integer.parseInt(userWish));
					bean.setHashTag(bean.getActivity_hashTag().split("&"));
					int su= bean.getActivity_img().indexOf("&");
					String imgName=bean.getActivity_img().substring(0,su);
					bean.setActivity_img(imgName);
					list.add(bean);
				}
				model.addAttribute("wishList",list);
				model.addAttribute("service",service);
				
			}else {
				List<ActivityVo> list = new ArrayList<ActivityVo>();
				ActivityVo bean = mypageDao.getAwishList(Integer.parseInt(aWishList));
				bean.setHashTag(bean.getActivity_hashTag().split("&"));
				int su= bean.getActivity_img().indexOf("&");
				String imgName=bean.getActivity_img().substring(0,su);
				bean.setActivity_img(imgName);
				list.add(bean);
				model.addAttribute("wishList",list);
				model.addAttribute("service",service);
			}
			
		}else if(StringUtils.equals("2",service )) {
			
			if(lWishList==null||lWishList.equals("")) {
				model.addAttribute("emptyList","비었습니다.");
				return;
			}else if(lWishList.contains("&")) {
				List<LodgementVo> list = new ArrayList<LodgementVo>();
				String[] wishList= lWishList.split("&");
				for(String userWish:wishList) {
					LodgementVo bean = mypageDao.getLwishList(Integer.parseInt(userWish));
					if(bean.getLodgement_hashTag().contains("&")) {
						bean.setHashTag(bean.getLodgement_hashTag().split("&"));
					}
					int su= bean.getLodgement_img().indexOf("&");
					String imgName=bean.getLodgement_img().substring(0,su);
					bean.setLodgement_img(imgName);
					list.add(bean);
				}
				model.addAttribute("wishList",list);
				model.addAttribute("service",service);
			}else {
				List<LodgementVo> list = new ArrayList<LodgementVo>();
				LodgementVo bean = mypageDao.getLwishList(Integer.parseInt(lWishList));
				if(bean.getLodgement_hashTag().contains("&")) {
					bean.setHashTag(bean.getLodgement_hashTag().split("&"));
				}
				int su= bean.getLodgement_img().indexOf("&");
				String imgName=bean.getLodgement_img().substring(0,su);
				bean.setLodgement_img(imgName);
				list.add(bean);
				
				
				
				model.addAttribute("wishList",list);
				model.addAttribute("service",service);
			}
		}
		
	}
	
	public LReviewDto getReviewInfoService(Model model,String service,int reservNumber) throws SQLException{
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		//액티비티일때
		LReviewDto reviewDto =null;
		if(service.equals("1")) {
			AReservInfoDto dto=myPageDao.getAReviewInfo(reservNumber);
			model.addAttribute("reviewInfo",dto);
			
		}else {
			reviewDto = myPageDao.getLReviewInfo(reservNumber);
			model.addAttribute("reviewInfo",reviewDto);
		}
		
		return reviewDto;
		
	}
	
	public void insertReviewService(ReviewVo reviewVo,int user_Number,String service) throws SQLException {
		
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		if(service.equals("2")) {
			reviewVo.setReview_content(reviewVo.getReview_content().replace("\r\n", " "));
			myPageDao.insertReview(reviewVo, user_Number);
			int reviewCount = myPageDao.getLReviewCount(reviewVo.getReview_articleNumber());
			int[] list = myPageDao.getLStarPoint(reviewVo.getReview_articleNumber());
			
			double reviewGradeRate=0;
			for(int i=0;i<list.length;i++) {
				reviewGradeRate+=list[i];
			}
			//소수점 2째자리까지
			reviewGradeRate=(int)(reviewGradeRate/list.length*10)/10.0;
			myPageDao.updateLReviewInfo(reviewVo.getReview_articleNumber(), reviewGradeRate, reviewCount);
		}else  {
			reviewVo.setReview_content(reviewVo.getReview_content().replace("\r\n", " "));
			myPageDao.insertReview(reviewVo, user_Number);
			int reviewCount = myPageDao.getAReviewCount(reviewVo.getReview_articleNumber());
			int[] list = myPageDao.getAStarPoint(reviewVo.getReview_articleNumber());
			
			double reviewGradeRate=0;
			for(int i=0;i<list.length;i++) {
				reviewGradeRate+=list[i];
			}
			//소수점 2째자리까지
			reviewGradeRate=(int)(reviewGradeRate/list.length*10)/10.0;
			myPageDao.updateAReviewInfo(reviewVo.getReview_articleNumber(), reviewGradeRate, reviewCount);
		}
		
	}
	@Override
	public int cartDeleteService(String service, int reservnumber, int user_number) throws SQLException {
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		if(service.equals("1")) {
			return myPageDao.deleteAcartInfo(reservnumber, user_number);
		}else if(service.equals("2")) {
			return myPageDao.deleteLcartInfo(reservnumber, user_number);
		}
		
		return -1;
	}
	
	
}
