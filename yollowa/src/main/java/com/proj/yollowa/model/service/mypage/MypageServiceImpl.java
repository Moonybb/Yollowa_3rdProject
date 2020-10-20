package com.proj.yollowa.model.service.mypage;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.entity.mypage.AReservInfoDto;
import com.proj.yollowa.model.entity.mypage.ActivityReviewVo;
import com.proj.yollowa.model.entity.mypage.AllReviewViewVo;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReviewDto;
import com.proj.yollowa.model.entity.mypage.LodgementReviewVo;
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
				Collections.reverse(list);
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
				Collections.reverse(list);
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
	
	// 아이디 찾기
	@Override
	public UserVo findId(String name, String phoneNumber) {
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		UserVo userBean=dao.findId(name,phoneNumber);
		return userBean;
	}
	
	// 비밀번호 찾기
	@Override
	public UserVo findPassword(String name, String id, String phoneNumber) {
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		UserVo userBean=dao.findPassword(name,id,phoneNumber);
		return userBean;
	}
	@Override
	public int searchPassword(String user_id,String user_password) throws SQLException {
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		return dao.searchPassword(user_id, user_password);
	}
	@Override
	public void changePasswordService(int user_number, String password) throws SQLException {
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		dao.updateUserPassword(user_number, password);
		
	}
	@Override
	public int deleteUser(int user_number) throws SQLException {
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		
		return dao.deleteUser(user_number);
	}
	@Override
	public void homeList(Model model) throws SQLException {
		
		MypageDao dao = sqlSession.getMapper(MypageDao.class);
		List<ActivityVo> alist=dao.getSortAcitivity();
		List<LodgementVo> llist=dao.getSortLodgement();
		String hashtag=null;
		if(alist.size()>4) {
			
		for(int i=0;i<4;i++) {
			ActivityVo bean = alist.get(i);
			hashtag=bean.getActivity_hashTag();
			if(bean.getActivity_img().contains("&")) {
				int su= bean.getActivity_img().indexOf("&");
				String imgName=bean.getActivity_img().substring(0,su);
				bean.setActivity_img(imgName);
			}
			if(hashtag.contains("&")) {
				bean.setHashTag(hashtag.split("&"));
			}
			List<Integer> list=dao.getAprice(bean.getActivity_number());
			Collections.sort(list);
			//sorting price\
//			int temp=0;
//			for(int i=0;i<price.length;i++) {
//				for(int j=i+1;j<price.length;j++) {
//					if(price[i]>price[j]) {
//						temp=price[i];
//						price[i]=price[j];
//						price[j]=temp;
//					}
//				}
//			}
			if(list.size()!=0) {
				bean.setPrice(list.get(0));
			}else {
				bean.setPrice(0);
			}
			
			
		}
		}
		if(llist.size()>4) {
		for(int i=0;i<4;i++) {
			LodgementVo bean=llist.get(i);
			hashtag=bean.getLodgement_hashTag();
			if(hashtag.contains("&")) {
				bean.setHashTag(hashtag.split("&"));
			}
			if(bean.getLodgement_img().contains("&")) {
				int su= bean.getLodgement_img().indexOf("&");
				String imgName=bean.getLodgement_img().substring(0,su);
				bean.setLodgement_img(imgName);
			}
			List<Integer> list=dao.getLprice(bean.getLodgement_number());
			Collections.sort(list);
			//sorting price\
			if(list.size()!=0) {
				bean.setPrice(list.get(0));
			}else {
				bean.setPrice(0);
			}
		}
		
		model.addAttribute("alist",alist);
		model.addAttribute("llist",llist);
		
		}	
	}
	@Override
	public void insertHostrqnServise(HostrqnApprovalVo hostrqnApprovalVo) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		
		mypageDao.insertHostrqn(hostrqnApprovalVo);
	}
	
	//사용자가 작성한 리뷰의 개수를 반환
	@Override
	public int getReviewCountService(SearchVo searchVo) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		return mypageDao.getReviewCount(searchVo);
	}
	//사용자가 작성한 모든 리뷰의 목록을 반환
	@Override
	public List<ReviewVo> getReviewListService(SearchVo searchVo) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		
		return mypageDao.getReviewList(searchVo);
	}
	//특정 사용자가 작성한 숙박 리뷰를 불러온다
	@Override
	public LodgementReviewVo getLodgementReviewService(int reviewno) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);
		
		return mypageDao.getLodgementReview(reviewno);
	}
	//특정 사용자가 작성한 액티비티 리뷰를 불러온다
	@Override
	public ActivityReviewVo getActivityReviewService(int reviewno) throws SQLException {
		MypageDao mypageDao = sqlSession.getMapper(MypageDao.class);

		return mypageDao.getActivityReview(reviewno);
	}
	//특정 사용자가 작성한 리뷰를 모두 불러온다(숙박+액티비티)
	@Override
	public List<AllReviewViewVo> getAllMyReviewListService(SearchVo searchVo) throws SQLException {
		String company;
		String img;
		int userNum;
		int goodsNum;
		int reviewNum;
		int reviewCategoryNum;
		int starNum;
		Date reviewedDate;
		String title;
		String content;
		String writer;

		List<AllReviewViewVo> resulReviewList = new ArrayList<AllReviewViewVo>();
		List<ReviewVo> reviewList = getReviewListService(searchVo);
		for (int i = 0; i < reviewList.size(); i++) {
			if(reviewList.get(i).getReview_category() == 2) {
				LodgementReviewVo temp= getLodgementReviewService(reviewList.get(i).getReview_reviewNumber());
				company = temp.getLodgement_companyName();
				img = temp.getLodgement_img();
				img = getFirstImg(img);
				userNum = temp.getLodgement_userNumber();
				goodsNum = temp.getLodgement_number();
				reviewNum = temp.getReview_reviewNumber();
				reviewCategoryNum = temp.getReview_articleNumber();
				starNum = temp.getReview_starPoint();
				reviewedDate = temp.getReview_writedDate();
				title=temp.getReview_title();
				content = temp.getReview_content();
				writer = temp.getReview_writer();
				resulReviewList.add(new AllReviewViewVo(
						company, img, userNum, goodsNum, reviewNum, 
						reviewCategoryNum, starNum, reviewedDate, title, content, writer)
						);
			}else {
				ActivityReviewVo temp = getActivityReviewService(reviewList.get(i).getReview_reviewNumber());
				company = temp.getActivity_title();
				img = temp.getActivity_img();
				img = getFirstImg(img);
				userNum = temp.getActivity_userNumber();
				goodsNum = temp.getActivity_number();
				reviewNum = temp.getReview_reviewNumber();
				reviewCategoryNum = temp.getReview_articleNumber();
				starNum = temp.getReview_starPoint();
				reviewedDate = temp.getReview_writedDate();
				title=temp.getReview_title();
				content = temp.getReview_content();
				writer = temp.getReview_writer();
				resulReviewList.add(new AllReviewViewVo(
						company, img, userNum, goodsNum, reviewNum, 
						reviewCategoryNum, starNum, reviewedDate, title, content, writer)
						);
			}
		}
//		Collections.reverse(resulReviewList);
		
		//한페이지에 보여줄 개수
		List<AllReviewViewVo> pageReviewList = new ArrayList<AllReviewViewVo>();
		int perPageNum =searchVo.getPerPageNum();
		int startNum= (searchVo.getPage()-1)*perPageNum;
		System.out.println("#"+startNum);
		int endNum = startNum+perPageNum;
		if(endNum>resulReviewList.size()) {
			endNum=resulReviewList.size();
		}
			
		System.out.println("PagingNew:"+startNum+"|"+endNum);
		for (int j = startNum; j < endNum; j++) {
			System.out.println("get"+j);
			pageReviewList.add(resulReviewList.get(j));
		}
		
		return pageReviewList;
	}
	
	// '&'로 구분된 텍스트에서 첫번째 요소(이미지)를 선택한다
	public String getFirstImg(String imgs) {
			String firstImg = "";
			int su = imgs.indexOf("&");
			firstImg = imgs.substring(0, su);
		return firstImg;
	}
	
}
