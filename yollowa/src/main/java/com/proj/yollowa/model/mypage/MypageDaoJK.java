package com.proj.yollowa.model.mypage;

import java.sql.SQLException;
import java.util.List;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.mypage.ActivityReviewVo;
import com.proj.yollowa.model.entity.mypage.LodgementReviewVo;

public interface MypageDaoJK {
	void insertHostrqn(HostrqnApprovalVo hostrqnApprovalVo) throws SQLException;
	int getReviewCount(SearchVo searchVo) throws SQLException;
	List<ReviewVo> getReviewList(SearchVo searchVo) throws SQLException;
	LodgementReviewVo getLodgementReview(int reviewno) throws SQLException;
	ActivityReviewVo getActivityReview(int reviewno) throws SQLException;
	
	//현재 사용되지 않음
	List<LodgementReviewVo> getLodgementReviewList(SearchVo searchVo) throws SQLException;
	List<ActivityReviewVo> getActivityReviewList(SearchVo searchVo) throws SQLException;
}

