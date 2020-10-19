package com.proj.yollowa.model.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	// 먼저 userNumber로 본인 wish 리스트를 가져와 null이면 그냥 번호만 이미 있는 찜목록이 있으면 & 붙여 update
	public String activityUserWishSelect(int userNumber);

	// 기존에 등록된 wish가 없을 때
	public void notExistWishUpdate(@Param("activityNumber") int activityNumber, @Param("userNumber") int userNumber);
	
	// 기존에 등록된 찜 목록이 있을 때 기존 + & 숙박글번호
	public void afterWishUpdate(@Param("afterWish") String afterWish,@Param("userNumber") int userNumber);
	
	// 액티비티 예약페이지 이동 - articleNumber로 등록된 옵션들 전부 select
	public List<ActivityOptionVo> selectOptions(int articleNumber);
	
	// 숙박 추천
	public List<LodgementVo> selectLodgementRecommend(@Param("map") Map<String, Double> map);
	
	
}
