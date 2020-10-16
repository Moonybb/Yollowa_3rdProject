package com.proj.yollowa.model.service.mypage;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.mypage.AReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReviewDto;

public interface MypageService {
	//유저 디테일
	public UserVo userDetailService(Model model,int user_number) throws SQLException;
	//숙박 예약 현황
	public List<LReservInfoDto> lReservationInfoService(Model model,int user_number,String service) throws SQLException;
	//숙박 이용 내역
	public List<LReservInfoDto> lUserCompletedInfoService(Model model,int user_number,String service) throws SQLException;
	//숙박 장바구니
	public List<LReservInfoDto> lUserCartInfoService(Model model,int user_number,String service) throws SQLException;
	// 유저 찜목록
	public void userWishListService(Model model, UserVo userVo, String service) throws SQLException;
	// 리뷰 쓸때 리뷰 정보 가져오기
	public LReviewDto getReviewInfoService(Model model,String service,int reservNumber) throws SQLException;
	//리뷰 인설트, 숙박테이블의 리뷰갯수와 별점 업데이트 해줌.
	public void insertReviewService(ReviewVo reviewVo,int user_Number,String service) throws SQLException;
	public List<AReservInfoDto> getActivityOverHistory(Model model,int user_number,String service) throws SQLException;
	public int cartDeleteService(String service,int reservnumber,int user_number) throws SQLException;
}
