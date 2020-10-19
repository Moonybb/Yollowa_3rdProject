package com.proj.yollowa.model.service.admin;

import java.sql.SQLException;
import java.util.List;

import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.ActivityApprovalVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.admin.LodgementApprovalVo;

public interface AdminpageService {

	List<HostrqnApprovalVo> getHostApprovalStandbyListService(SearchVo searchVo) throws SQLException;
	int countHosrqnService(SearchVo searchVo) throws SQLException;
	HostrqnApprovalVo getHostApprovalStandbyService(int hostrqn_no) throws SQLException;
	UserVo getUserService(int user_number) throws SQLException;
	void updateUserLevelToHostService(UserVo userVo, int hostrqn_info) throws SQLException;
//	승인을 한 사업장 등록 항목 hostrqn 테이블에서 삭제한다
	void deleteOneHostrqnService(int hostrqn_no) throws SQLException;
	List<ActivityApprovalVo> getActivityApprovalStandbyListService(SearchVo searchVo) throws SQLException;
	int countActivityApprovalStandbyListService(SearchVo searchVo) throws SQLException;
	void updateActivityTempToApprovedService(int activity_number) throws SQLException;
	List<LodgementApprovalVo> getLodgementApprovalStandbyListService(SearchVo searchVo) throws SQLException;
	int countLodgementApprovalStandbyListService(SearchVo searchVo) throws SQLException;
	void updateLodgementTempToApprovedService(int lodgement_number) throws SQLException;
	List<ManagerVo> getManagerListService(SearchVo searchVo) throws SQLException;
	int countManagerList(SearchVo searchVo) throws SQLException;
	ManagerVo getManagerService(int manager_number) throws SQLException;
	void updateManagerService(ManagerVo bean) throws SQLException;
	void deleteManagerService(int manager_number) throws SQLException;
	void insertManagerService(ManagerVo bean) throws SQLException;
	UserVo updateHostPreProcessService(int user_number, int hostrqn_no) throws SQLException;
	int getUserNumberService(SearchVo searchVo) throws SQLException;
}
