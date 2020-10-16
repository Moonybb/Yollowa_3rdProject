package com.proj.yollowa.model.service.mypage;

import java.sql.SQLException;
import java.util.List;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.mypage.ActivityReviewVo;
import com.proj.yollowa.model.entity.mypage.AllReviewViewVo;
import com.proj.yollowa.model.entity.mypage.LodgementReviewVo;

public interface MypageServiceJK {
	void insertHostrqnServise(HostrqnApprovalVo hostrqnApprovalVo) throws SQLException;
	int getReviewCountService(SearchVo searchVo) throws SQLException;
	List<ReviewVo> getReviewListService(SearchVo searchVo) throws SQLException;
	LodgementReviewVo getLodgementReviewService(int reviewno) throws SQLException;
	ActivityReviewVo getActivityReviewService(int reviewno) throws SQLException;
	List<AllReviewViewVo> getAllMyReviewListService(SearchVo searchVo) throws SQLException;
	
}
