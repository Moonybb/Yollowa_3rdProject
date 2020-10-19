package com.proj.yollowa.model.adminpage;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.ActivityApprovalVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.admin.LodgementApprovalVo;

public interface AdminDao {
//	HOST 권한을 요청한 USER들을 hostrqn과 user 테이블과 매칭하여 출력한다
	List<HostrqnApprovalVo> getHostApprovalStandbyList(SearchVo searchVo) throws SQLException;
//  hostrqn 요청 조건에 따른 출력 결과물의 총계를 반환한다
	int countHostrqn(SearchVo searchVo) throws SQLException;
//	해당 hostrqn를 가져온다
	HostrqnApprovalVo getHostApprovalStandby(int hostrqn_no) throws SQLException;
//	해당 user의 정보를 가저온다
	UserVo getUser(int user_number) throws SQLException;
//	권한이 승인 된 후 승인된 사업자 정보를 업데이트 한다
	void updateUserLevelToHost(@Param("user") UserVo bean, @Param("hostrqn_info") int hostrqn_info) throws SQLException;
//	승인을 한 사업장 등록 항목 hostrqn 테이블에서 삭제한다
	void deleteOneHostrqn(int hostrqn_no) throws SQLException;
//	승인이 필요한 ACTIVITY 항목을 출력한다
	List<ActivityApprovalVo> getActivityApprovalStandbyList(SearchVo searchVo) throws SQLException;
//  Activity 등록 승인 목록에서 사용자의 요청 조건에 따른 출력 결과물의 총계를 반환한다	
	int countActivityApprovalStandbyList(SearchVo searchVo) throws SQLException;
//	ACTIVITY 테이블의 ACTIVITY_TEMP 값을 1로 UPDATE한다
	void updateActivityTempToApproved(int activity_number) throws SQLException;
//	승인이 필요한 LODGEMENT 항목을 출력한다
	List<LodgementApprovalVo> getLodgementApprovalStandbyList(SearchVo searchVo) throws SQLException;
	int countLodgementApprovalStandbyList(SearchVo searchVo) throws SQLException;
//	LODGEMENT 테이블의 LODGEMENT_TEMP 값을 1로 UPDATE한다 
	void updateLodgementTempToApproved(int lodgement_number) throws SQLException;
	List<ManagerVo> getManagerList(SearchVo searchVo) throws SQLException;
	int countManagerList(SearchVo searchVo) throws SQLException;
	ManagerVo getManager(int manager_number) throws SQLException;
	void updateManager(ManagerVo managerVo) throws SQLException;
	void deleteManager(int manager_number) throws SQLException;
	void insertManager(ManagerVo bean) throws SQLException;
	int getUserNumber(SearchVo searchVo) throws SQLException;
}
