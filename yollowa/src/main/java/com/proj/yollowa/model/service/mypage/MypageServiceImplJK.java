package com.proj.yollowa.model.service.mypage;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.mypage.ActivityReviewVo;
import com.proj.yollowa.model.entity.mypage.AllReviewViewVo;
import com.proj.yollowa.model.entity.mypage.LodgementReviewVo;
import com.proj.yollowa.model.mypage.MypageDaoJK;

@Service
public class MypageServiceImplJK implements MypageServiceJK{

	@Inject
	SqlSession sqlSession;
	//관리자에게 사업자 권한을 요구한다
	@Override
	public void insertHostrqnServise(HostrqnApprovalVo hostrqnApprovalVo) throws SQLException {
		MypageDaoJK mypageDaoJK = sqlSession.getMapper(MypageDaoJK.class);
		
		mypageDaoJK.insertHostrqn(hostrqnApprovalVo);
	}
	
	//사용자가 작성한 리뷰의 개수를 반환
	@Override
	public int getReviewCountService(SearchVo searchVo) throws SQLException {
		MypageDaoJK mypageDaoJK = sqlSession.getMapper(MypageDaoJK.class);
		return mypageDaoJK.getReviewCount(searchVo);
	}
	//사용자가 작성한 모든 리뷰의 목록을 반환
	@Override
	public List<ReviewVo> getReviewListService(SearchVo searchVo) throws SQLException {
		MypageDaoJK mypageDaoJK = sqlSession.getMapper(MypageDaoJK.class);
		
		return mypageDaoJK.getReviewList(searchVo);
	}
	//특정 사용자가 작성한 숙박 리뷰를 불러온다
	@Override
	public LodgementReviewVo getLodgementReviewService(int reviewno) throws SQLException {
		MypageDaoJK mypageDaoJK = sqlSession.getMapper(MypageDaoJK.class);
		
		return mypageDaoJK.getLodgementReview(reviewno);
	}
	//특정 사용자가 작성한 액티비티 리뷰를 불러온다
	@Override
	public ActivityReviewVo getActivityReviewService(int reviewno) throws SQLException {
		MypageDaoJK mypageDaoJK = sqlSession.getMapper(MypageDaoJK.class);

		return mypageDaoJK.getActivityReview(reviewno);
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
			if(reviewList.get(i).getReview_category() ==1) {
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
