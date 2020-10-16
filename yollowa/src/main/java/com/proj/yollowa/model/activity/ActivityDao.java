package com.proj.yollowa.model.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.proj.yollowa.model.entity.activity.AOInfoVo;
import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityOptionVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.activity.ReviewVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;

public interface ActivityDao {
	//////////////// 액티비티 list start
	
	// 액티비티 리스트 페이지
	public List<ActivityVo> activityListAll();
	//리스트 개수
	public int activityListCnt() throws SQLException; 
  	// ajax select Price (activity list page)
	public List<ActivityOptionVo> priceSelect(int activityNumber);
	// 액티비티 리스트 검색
	public List<ActivityVo> activitySearch(String search);
	
	// 지역 필터
	// '/'로 나눠져있지 않은 것 selectLocationFilterOne
	public List<ActivityVo> selectLocationFilterOne(String locationFilter);
	// 검색 건수를 알려주기 위해 count 요청
	public int selectLocationFilterOneCnt(String locationFilter);
	//////////////// 액티비티 list end
	
	
	//리뷰
	public ArrayList<ReviewVo> reviewList(@Param("articleNumber") int articleNumber,@Param("category") int category) throws SQLException;
	
	// 액티비티 디테일 페이지
	public List<ActivityDetailPageDto> activityDetail(int activity_number);

	// 액티비티 디테일 이미지
	public String activityImgSelect(int activity_number);

	// 액티비티 디테일 기본정보
	public List<InformationVo> activityInfo(@Param("number") int activity_number,@Param("type") int type);
	
	
}
