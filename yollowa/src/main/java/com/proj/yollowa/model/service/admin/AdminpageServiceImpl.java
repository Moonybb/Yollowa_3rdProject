package com.proj.yollowa.model.service.admin;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.proj.yollowa.model.adminpage.AdminDao;
import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.ActivityApprovalVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.admin.LodgementApprovalVo;

@Service
public class AdminpageServiceImpl implements AdminpageService{

	@Inject
	SqlSession sqlsession;
	
	//사업자 권한을 신청한 사용자들의 목록을 가져온다
	@Override
	public List<HostrqnApprovalVo> getHostApprovalStandbyListService() throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getHostApprovalStandbyList();
	}
	
	@Override
	public HostrqnApprovalVo getHostApprovalStandbyService(int hostrqn_no) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getHostApprovalStandby(hostrqn_no);
	}
	
	@Override
	public UserVo getUserService(int user_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		return adminpageDao.getUser(user_number);
	}
	
	@Override
	public UserVo updateHostPreProcessService(int user_number, int hostrqn_no) throws SQLException {
		UserVo userVo = getUserService(user_number);
		HostrqnApprovalVo hostrqnApprovalVo= getHostApprovalStandbyService(hostrqn_no);
		if(userVo.getUser_companyNumber().isEmpty()) {
			System.out.println("등록하셨던 사업자 번호가 없습니다");
			userVo.setUser_companyNumber(hostrqnApprovalVo.getHostrqn_companyNumber());
		}else {
			System.out.println("등록하셨던 사업자 번호가 있습니다");
			String args = userVo.getUser_companyNumber() + "&" +
					hostrqnApprovalVo.getHostrqn_companyNumber();
			userVo.setUser_companyNumber(args);
					
		}
		if(hostrqnApprovalVo.getHostrqn_info()==1 && userVo.getUser_companyName().isEmpty()) {
			System.out.println("숙박 사업장을 등록하신 적이 없습니다");
			userVo.setUser_companyName(hostrqnApprovalVo.getHostrqn_companyName());
		}else if(hostrqnApprovalVo.getHostrqn_info()==1 && userVo.getUser_companyName().isEmpty()==false) {
			System.out.println("숙박 사업장을 등록하신 적이 있습니다");
			String args = userVo.getUser_companyName() + "&" +
					hostrqnApprovalVo.getHostrqn_companyName();
			userVo.setUser_companyName(args);
		}else if(hostrqnApprovalVo.getHostrqn_info()==2 && userVo.getUser_activityCompanyName().isEmpty()) {
			System.out.println("액티비티 사업장을 등록하신적이 없습니다");
			userVo.setUser_activityCompanyName(hostrqnApprovalVo.getHostrqn_companyName());
		}else if(hostrqnApprovalVo.getHostrqn_info()==2 && userVo.getUser_activityCompanyName().isEmpty()==false) {
			System.out.println("액티비티 사업장을 등록하신적이 있습니다");
			String args = userVo.getUser_activityCompanyName() + "&" +
					hostrqnApprovalVo.getHostrqn_companyName();
			userVo.setUser_activityCompanyName(args);
		}
//		System.out.println("@@@@@@@@@@@@"+userVo);
//		System.out.println("@@@@@@@@@@@@@@@"+hostrqnApprovalVo);
		return userVo;
	}
	
	//사업자 권한을 신청한 사용자들을 승인해준다
	@Override
	public void updateUserLevelToHostService(UserVo userVo, int hostrqn_info) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateUserLevelToHost(userVo, hostrqn_info);
	}
	
	@Override
	public void deleteOneHostrqnService(int hostrqn_no) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.deleteOneHostrqn(hostrqn_no);
	}
	
	@Override
	public List<ActivityApprovalVo> getActivityApprovalStandbyListService() throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getActivityApprovalStandbyList();
	}

	@Override
	public void updateActivityTempToApprovedService(int activity_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateActivityTempToApproved(activity_number);;
	}

	@Override
	public List<LodgementApprovalVo> getLodgementApprovalStandbyListService() throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getLodgementApprovalStandbyList();
	}

	@Override
	public void updateLodgementTempToApprovedService(int lodgement_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateLodgementTempToApproved(lodgement_number);
	}
	
	//Manager
	@Override
	public List<ManagerVo> getManagerListService() throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getManagerList();
	}

	@Override
	public ManagerVo getManagerService(int manager_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getManager(manager_number);
	}

	@Override
	public void updateManagerService(ManagerVo bean) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateManager(bean);
	}

	@Override
	public void deleteManagerService(int manager_number) throws SQLException {
		AdminDao adminpageDao =sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.deleteManager(manager_number);
	}

	@Override
	public void insertManagerService(ManagerVo bean) throws SQLException {
		AdminDao adminpageDao =sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.insertManager(bean);
	}



}
