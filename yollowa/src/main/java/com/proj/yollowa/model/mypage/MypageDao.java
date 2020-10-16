package com.proj.yollowa.model.mypage;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.entity.mypage.AReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
import com.proj.yollowa.model.entity.mypage.LReviewDto;

public interface MypageDao {
	public UserVo userDetail(int user_number) throws SQLException;
	public List<LReservInfoDto> getLreservationInfo(@Param("USER_NUMBER") int user_number) throws SQLException;
	public List<LReservInfoDto> getLuserCompletedInfo(@Param("USER_NUMBER") int user_number) throws SQLException;
	public List<LReservInfoDto> getLuserCartInfo(@Param("USER_NUMBER") int user_number) throws SQLException;
	public LodgementVo getLarticleInfo(@Param("LRESERVINFO_ACTICLENUMBER") int lReservInfo_acticleNumber) throws SQLException;
	public LodgementVo getLwishList(@Param("lodgement_number") int lodgement_number) throws SQLException;
	public ActivityVo getAwishList(@Param("activity_number") int activity_number) throws SQLException;
	public LReviewDto getLReviewInfo(@Param("LRESERVINFO_NUMBER") int reservNumber) throws SQLException;
	public AReservInfoDto getAReviewInfo(@Param("ARESERVINFO_NUMBER") int reservNumber) throws SQLException;
	public void insertReview(@Param("review") ReviewVo reviewVo,@Param("user_Number") int user_Number) throws SQLException;
	public int getLReviewCount(@Param("review_articleNumber") int review_articleNumber) throws SQLException;
	public int getAReviewCount(@Param("review_articleNumber") int review_articleNumber) throws SQLException;
	public int[] getLStarPoint(@Param("review_articleNumber") int review_articleNumber) throws SQLException;
	public int[] getAStarPoint(@Param("review_articleNumber") int review_articleNumber) throws SQLException;
	public int updateLReviewInfo(
			@Param("review_articleNumber") int review_articleNumber,
			@Param("reviewGradeRate") double reviewGradeRate,
			@Param("reviewCount") int reviewCount
			) throws SQLException;
	public int updateAReviewInfo(
			@Param("review_articleNumber") int review_articleNumber,
			@Param("reviewGradeRate") double reviewGradeRate,
			@Param("reviewCount") int reviewCount
			) throws SQLException;
	public int getLExistReview(@Param("lreservInfo_number") int lreservInfo_number) throws SQLException;
	public List<AReservInfoDto> getAreservationInfo(int user_number) throws SQLException;
	public List<AReservInfoDto> getOverHistory(int user_number) throws SQLException;
	public List<AReservInfoDto> getAuserCartInfo(int user_number) throws SQLException;
	public int getAExistReview(int areservInfo_number) throws SQLException;
	public int deleteLcartInfo(@Param("LReservInfo_number") int LReservInfo_number,@Param("user_number") int user_number) throws SQLException;
	public int deleteAcartInfo(@Param("AReservInfo_number") int AReservInfo_number,@Param("user_number") int user_number) throws SQLException;
}

