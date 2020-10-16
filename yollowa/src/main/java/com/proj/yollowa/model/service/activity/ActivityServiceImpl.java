package com.proj.yollowa.model.service.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.proj.yollowa.model.activity.ActivityDao;
import com.proj.yollowa.model.entity.activity.AOInfoVo;
import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityOptionVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.activity.ReviewVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Inject
	SqlSession sqlSession;
	
	// 액티비티 리스트
		@Override
		public List<ActivityVo> activityListAll(Model model) throws SQLException {
			ActivityDao dao =sqlSession.getMapper(ActivityDao.class);
			List<ActivityVo> alist= dao.activityListAll();
			
			List<ActivityVo> list= dao.activityListAll();
			for(int i=0; i<list.size(); i++) {
				int su = list.get(i).getActivity_img().indexOf("&");
				String imgName = list.get(i).getActivity_img().substring(0, su);
				list.get(i).setActivity_img(imgName);
			}
			model.addAttribute("listAll",list);
			
			return alist;
		}

		// 액티비티 리스트 temp=1인 전체 개수
		@Override
		public int activityListCnt() throws SQLException {
			ActivityDao dao=sqlSession.getMapper(ActivityDao.class);
			int cnt =dao.activityListCnt();
			return cnt;
		}
	
		// ajax select Price (activity list page)
		@Override
		public int priceSelect(int activityNumber) {
			ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
			List<ActivityOptionVo> list = dao.priceSelect(activityNumber);
//			System.out.println("액티비티service return list :: "+list);
			
			int price = list.get(0).getActivityOption_price();
//			System.out.println(activityNumber+"의 방 가격"+price);
			
			return price;
		}
	// 액티비티 디테일 리뷰 // 숙박에서 사용중 삭제 x
	@Override
	public ArrayList<ReviewVo> reviewList(int articleNumber, int category, Model model) throws SQLException {
		ActivityDao dao=sqlSession.getMapper(ActivityDao.class);
		ArrayList<ReviewVo> list =dao.reviewList(articleNumber, category);
		model.addAttribute("reviewList", list);
		return list;
	}
		// 액티비티 리스트 검색
		@Override
		public void activitySearch(String search, Model model) {
			ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
			List<ActivityVo> list = dao.activitySearch(search);
			
			for(int i=0; i<list.size(); i++) {
				int su = list.get(i).getActivity_img().indexOf("&");
				String imgName = list.get(i).getActivity_img().substring(0, su);
				list.get(i).setActivity_img(imgName);
			}
			
			model.addAttribute("listAll", list);
		}
		
		// 액티비티 리스트 지역필터
		@Override
		public void activityLocationFilterSelect(String locationFilter, Model model) {
			ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
			
			// '/'로 나눠져있을 수 있기 떄문에 /로 split
			if(locationFilter.contains("/")) {
				String[] filterSplitArr = locationFilter.split("/");
				List<ActivityVo> list = new ArrayList<ActivityVo>();
				
				int cnt =0;
				
				for(int i=0; i<filterSplitArr.length; i++) {
					// 스플릿돼서 나온 배열 length만큼 돌려 list에 담아놓고 위에 만들어 놓은 list 각각의 요소를 다시 add
					List<ActivityVo> tempList = dao.selectLocationFilterOne(filterSplitArr[i]);
					
					// 누적할 검색 건수 누적
					cnt += dao.selectLocationFilterOneCnt(locationFilter);
					
					// 위에서 나온 list의 안의 요소를 위에 만들어놓은 list에 각각 add
					for(int j=0; j<tempList.size(); j++) {

						// list에 각각 add
						list.add(tempList.get(j));
					}	
				}
				model.addAttribute("filterCnt", cnt);
				
				for(int i=0; i<list.size(); i++) {
					int su = list.get(i).getActivity_img().indexOf("&");
					String imgName = list.get(i).getActivity_img().substring(0, su);
					list.get(i).setActivity_img(imgName);
				}
				
				model.addAttribute("listAll",list);
				
			}else {
				// 전체 선택시 걸러주기
				if(locationFilter.contains("전체")) {
					String splitAll = locationFilter.replaceAll(" 전체", "");
					
					List<ActivityVo> list = dao.selectLocationFilterOne(splitAll);
					
					// 검색 건수를 알려주기 위해 count 요청
					int cnt = dao.selectLocationFilterOneCnt(splitAll);
					model.addAttribute("filterCnt", cnt);
					
					for(int i=0; i<list.size(); i++) {
						int su = list.get(i).getActivity_img().indexOf("&");
						String imgName = list.get(i).getActivity_img().substring(0, su);
						list.get(i).setActivity_img(imgName);
					}
					
					model.addAttribute("listAll",list);
					
					// 리턴시켜버림
					return;
				}
					
				// '/'로 나눠져있지 않은 것은 바로 보냄
				List<ActivityVo> list = dao.selectLocationFilterOne(locationFilter);
				
				// 검색 건수를 알려주기 위해 count 요청
				int cnt = dao.selectLocationFilterOneCnt(locationFilter);
				model.addAttribute("filterCnt", cnt);
				
				for(int i=0; i<list.size(); i++) {
					int su = list.get(i).getActivity_img().indexOf("&");
					String imgName = list.get(i).getActivity_img().substring(0, su);
					list.get(i).setActivity_img(imgName);
				}
				
				model.addAttribute("listAll",list);
			}
			
		}
		
		
		// 액티비티 리스트 ↑
	
	// 액티비티 디테일 리스트
	public List<ActivityDetailPageDto> activityDetail(int activity_number, Model model) {
		ActivityDao dao =sqlSession.getMapper(ActivityDao.class);
		List<ActivityDetailPageDto> list = dao.activityDetail(activity_number);

		model.addAttribute("detailList",list);
		return list;
	}

	// 디테일 이미지
	@Override
	public void activityImgSelect(int activity_number, Model model) {
		ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
		
		String titleImg = dao.activityImgSelect(activity_number);
		model.addAttribute("listImg", titleImg);
	}

	// 디테일 기본정보
	@Override
	public void activityInfo(int activity_number, int type, Model model) {
		ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
		List<InformationVo> list= dao.activityInfo(activity_number,type);
		
		model.addAttribute("infoList",list);
	}
	
	
	// 위시리스트
	@Override
	public void activityWishUpdate(int activityNumber, int userNumber) {
		ActivityDao dao = sqlSession.getMapper(ActivityDao.class);
		// 먼저 userNumber로 본인 wish 리스트를 가져와 null이면 그냥 번호만 이미 있는 찜목록이 있으면 & 붙여 update
		String existWishList = dao.activityUserWishSelect(userNumber);
		
		if(existWishList==null) {
			// 기존에 등록된 찜 목록이 없을 때 그냥 update
			System.out.println("기존에 등록된 wish없음");
			dao.notExistWishUpdate(activityNumber, userNumber);
		}else {
			// 중복 검사
			String arr[] = existWishList.split("&");
			for(int i=0; i<arr.length; i++) {
				if(arr[i].contains(""+activityNumber)) {
					System.out.println("번호 중복");
					// &로 스플릿한 배열 요소중에 가져온 activityNumber가 있으면 들어옴
					return;
				}
			}
			// 중복검사에 걸리지 않았을 때
			// 기존에 등록된 찜 목록이 있을 때 기존 + & 숙박글번호
			String afterWish = existWishList+"&"+activityNumber;
			dao.afterWishUpdate(afterWish, userNumber);
			System.out.println("기존에 등록된 wish 있음");
			
		}
	}
	

}













