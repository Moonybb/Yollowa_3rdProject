package com.proj.yollowa.model.service.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.activity.ReviewVo;
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
}