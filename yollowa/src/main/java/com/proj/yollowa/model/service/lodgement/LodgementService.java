package com.proj.yollowa.model.service.lodgement;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementDetailPageDto;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;

public interface LodgementService {

	// 숙박 리스트
	List<LodgementVo> lodgementListAll(Model model) throws SQLException;
	// 숙박 리스트 temp=1인 전체 개수
	int lodgementListCnt() throws SQLException;
	// ajax select Price (lodgement list page)
	int priceSelect(int lodgementNumber);

	
	
	
	
	//숙박 디테일 
	List<LodgementDetailPageDto> lodgementDetail(int articleNumber, Model model) throws SQLException;
	
	// 숙박 타이틀 이미지 select
	void lodgementImgSelect(int number, Model model);

	
	// lodgement list page search
	void lodgementSearch(String search, Model model);
	
	// 숙박 디테일 기본정보
	List<InformationVo> lodgementInfo(int number, int type,Model model) throws SQLException;
	
	// 숙박 예약페이지 지정된 방정보
	List<LodgementRoomInfoVo> lodgementReserInfo(int articleNumber, int roomNumber, Model model) throws SQLException;

	
	// 숙박 유저정보
	UserVo lodgementReserUser(UserVo user, Model model) throws SQLException;
	
	// 숙박 선택한 방 성수기 날짜
	LodgementRoomInfoVo lodgementpeakDays(int articleNumber, int roomNumber, Model model) throws SQLException;
	
	


	// insert 하기 전에 받아온 정보들로 roomInfo에서 날짜 상대적으로 가격을 받아낸다 (시작날짜 기준)
	int roomPaymentSelect(int roomNumber, Date startDate, Date endDate);

	// 숙박 장바구니 insert
	void lodgementCartInsert(int articleNumber, int roomNumber, Date startDate, Date endDate,int payment, UserVo userVo);

	// 숙박 찜목록 insert
	void lodgementWishUpdate(int lodgementNumber, int userNumber);

	
	// 지역 필터
	void lodgementLocationFilterSelect(String locationFilter, Model model);
	
	// 결제 성공시 예약정보에 insert (바로구매)
	void LReservInfoInsert(int userNumber, int articleNumber, int roomNumber, java.sql.Date checkIn, java.sql.Date checkOut,
			String userPhoneNumber, int resultPrice);
	
	//결제 성공시 예약정보 update (장바구니결제)
	void LReservInfoUpdate(int c);

}