package com.proj.yollowa.model.lodgement;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementDetailPageDto;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;

public interface LodgementDao {

	// 숙박 리스트 페이지
	public List<LodgementVo> lodgementListAll() throws SQLException;
	// 숙박 리스트 temp=1인 전체 개수
	public int lodgementListCnt() throws SQLException;
	
	// 디테일 페이지
	public List<LodgementDetailPageDto> lodgementDetail(@Param("articleNumber") int articleNumber) throws SQLException;
	
//	// ajax select Price (lodgement list page)
	public List<LodgementRoomInfoVo> priceSelect(int lodgementNumber);

	// 숙박글 타이틀 캐러셀 select
	public String lodgementImgSelect(int number);

	// lodgement list page search
	public List<LodgementVo> lodgementSearch(String search);
	
	// 숙박 디테일 기본정보
	public List<InformationVo> lodgementInfo(@Param("number") int number,@Param("type") int type) throws SQLException;
	
	// 숙박 예약 페이지 지정된 방정보
	public List<LodgementRoomInfoVo> lodgementReserInfo(@Param("articleNumber") int articleNumber,@Param("roomNumber") int roomNumber) throws SQLException;
	

	// 숙박 유저정보
	public UserVo lodgementReserUser(int userNumber) throws SQLException;
	
	// 숙박 선택한 방 성수기날짜
	public LodgementRoomInfoVo lodgementpeakDays(@Param("articleNumber") int articleNumber,@Param("roomNumber") int roomNumber) throws SQLException;

	// 먼저 성수기, 비성수기 가격을 받아온 후 가져온 startDate가 성수기인지 비성수기인지 비교
	public Date roomPeakStartDateSelect(int roomNumber);
	public Date roomPeakEndDateSelect(int roomNumber);
	
	
	// 아래에서 성수기면 해당 방의 성수기가격을, 비성수기면 비성수기 가격을 select
	public int selectPeakPayment(int roomNumber);
	public int selectOffPeakPayment(int roomNumber);
	
	// 숙박 장바구니 ajax
	public void lodgementCartInsert(@Param("articleNumber") int articleNumber,@Param("roomNumber") int roomNumber,@Param("startDate") Date startDate,@Param("endDate") Date endDate,@Param("payment") int payment,@Param("userVo") UserVo userVo);
	
	
	// 숙박 찜목록

	// 먼저 userNumber로 본인 wish 리스트를 가져와 null이면 그냥 번호만 이미 있는 찜목록이 있으면 & 붙여 update
	public String lodgementUserWishSelect(int userNumber);
	
	// 기존에 등록된 wish가 없을 때
	public void notExistWishUpdate(@Param("lodgementNumber") int lodgementNumber,@Param("userNumber") int userNumber);
	
	// 기존에 등록된 찜 목록이 있을 때 기존 + & 숙박글번호
	public void afterWishUpdate(@Param("afterWish") String afterWish,@Param("userNumber") int userNumber);
	
	// 지역 필터
	// '/'로 나눠져있지 않은 것 selectLocationFilterOne
	public List<LodgementVo> selectLocationFilterOne(String locationFilter);
	// 검색 건수를 알려주기 위해 count 요청
	public int selectLocationFilterOneCnt(String locationFilter);
	
	// 결제 성공시 예약정보에 insert (바로구매)
	public void LReservInfoInsert(@Param("userNumber") int userNumber,@Param("articleNumber") int articleNumber,@Param("roomNumber") int roomNumber,@Param("checkIn") java.sql.Date checkIn,
			@Param("checkOut") java.sql.Date checkOut,@Param("userPhoneNumber") String userPhoneNumber,@Param("resultPrice") int resultPrice);
	
	// 결제 성공시 예약정보 update (장바구니 결제)
	public void LReservInfoUpdate(int c);
	
	
}
