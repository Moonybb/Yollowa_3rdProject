package com.proj.yollowa.model.service.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

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
	
	//액티비티 디테일
	void activityDetail(Model model, int number) throws SQLException;
	//액티비티 디테일 옵션 칸
	void activityOption(int articleNumber,Model model) throws SQLException;
	// 리뷰 리스트
	ArrayList<ReviewVo> reviewList(int articleNumber,int category,Model model) throws SQLException;
	// 리뷰 카운트
	int activityReviewCount(int articleNumber,int category) throws SQLException;
	
}