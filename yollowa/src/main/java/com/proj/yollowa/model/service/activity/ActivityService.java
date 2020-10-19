package com.proj.yollowa.model.service.activity;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityOptionVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.activity.ReviewVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;

public interface ActivityService {
	// 액티비티 리스트
	List<ActivityVo> activityListAll(Model model) throws SQLException;
	// 액티비티 리스트 개수
	int activityListCnt() throws SQLException;
	// ajax select Price (activity list page)
	int priceSelect(int activityNumber);
	// 액티비티 리스트 검색
	void activitySearch(String search, Model model);
	// 지역 필터
	void activityLocationFilterSelect(String locationFilter, Model model);
	
	
	// 액티비티 디테일 리뷰 // 숙박에서 사용중 삭제 x
	ArrayList<ReviewVo> reviewList(int articleNumber,int category,Model model) throws SQLException;

	// 액티비티 디테일 리스트
	List<ActivityDetailPageDto> activityDetail(int activity_number, Model model);

	// 디테일 이미지
	void activityImgSelect(int activity_number, Model model);
	
	// 디테일 기본정보
	void activityInfo(int activity_number, int type, Model model);
	
	// 디테일 찜목록 
	void activityWishUpdate(int activityNumber, int userNumber);
	
	// 액티비티 예약페이지 이동 - articleNumber로 등록된 옵션들 전부 select
	List<ActivityOptionVo> selectOptions(int articleNumber);
	
	// 주변 숙박 추천
	List<LodgementVo> selectLodgementRecommend(double activityLat, double activityLng, Model model);
	// 예약 옵션 이름
	List<ActivityOptionVo> activityOptionName(int optionNumber, int articleNumber);
	InformationVo activityRefund(int articleNumber);
	
	// 예약 완료 insert
	void AReservInfoInsert(int userNumber, int articleNumber, int optionNumber, int amount, String userPhoneNumber,
			int unitPrice, int payment,Date checkOut);
}