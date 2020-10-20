package com.proj.yollowa.model.service.admin;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.proj.yollowa.model.adminpage.AdminDao;
import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.SearchVo;
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
	public List<HostrqnApprovalVo> getHostApprovalStandbyListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getHostApprovalStandbyList(searchVo);
	}
	
	@Override
	public int countHosrqnService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		return adminpageDao.countHostrqn(searchVo);
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

		if(StringUtils.isEmpty(userVo.getUser_companyNumber())) {
			System.out.println("등록하셨던 사업자 번호가 없습니다");
			userVo.setUser_companyNumber(hostrqnApprovalVo.getHostrqn_companyNumber());
		}else {
			System.out.println("등록하셨던 사업자 번호가 있습니다");
			String args = userVo.getUser_companyNumber() + "&" +
					hostrqnApprovalVo.getHostrqn_companyNumber();
			userVo.setUser_companyNumber(args);
		}
		if(hostrqnApprovalVo.getHostrqn_info()==1 && StringUtils.isEmpty(userVo.getUser_companyName())) {
			System.out.println("숙박 사업장을 등록하신 적이 없습니다");
			userVo.setUser_companyName(hostrqnApprovalVo.getHostrqn_companyName());
		}else if(hostrqnApprovalVo.getHostrqn_info()==1 && StringUtils.isEmpty(userVo.getUser_companyName())==false) {
			System.out.println("숙박 사업장을 등록하신 적이 있습니다");
			String args = userVo.getUser_companyName() + "&" +
					hostrqnApprovalVo.getHostrqn_companyName();
			userVo.setUser_companyName(args);
		}else if(hostrqnApprovalVo.getHostrqn_info()==2 && StringUtils.isEmpty(userVo.getUser_activityCompanyName())) {
			System.out.println("액티비티 사업장을 등록하신적이 없습니다");
			userVo.setUser_activityCompanyName(hostrqnApprovalVo.getHostrqn_companyName());
		}else if(hostrqnApprovalVo.getHostrqn_info()==2 && StringUtils.isEmpty(userVo.getUser_activityCompanyName())==false) {
			System.out.println("액티비티 사업장을 등록하신적이 있습니다");
			String args = userVo.getUser_activityCompanyName() + "&" +
					hostrqnApprovalVo.getHostrqn_companyName();
			userVo.setUser_activityCompanyName(args);
		}
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
	public List<ActivityApprovalVo> getActivityApprovalStandbyListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		List<ActivityApprovalVo> list = adminpageDao.getActivityApprovalStandbyList(searchVo);
		
		for(int i=0; i<list.size(); i++) {
			int su = list.get(i).getActivity_img().indexOf("&");
			String imgName = list.get(i).getActivity_img().substring(0, su);
			list.get(i).setActivity_img(imgName);
		}
		
		return list;
	}
	@Override
	public int countActivityApprovalStandbyListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.countActivityApprovalStandbyList(searchVo);
	}
	@Override
	public void updateActivityTempToApprovedService(int activity_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateActivityTempToApproved(activity_number);;
	}

	@Override
	public List<LodgementApprovalVo> getLodgementApprovalStandbyListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		List<LodgementApprovalVo> list = adminpageDao.getLodgementApprovalStandbyList(searchVo);
		for(int i=0; i<list.size(); i++) {
			int su = list.get(i).getLodgement_img().indexOf("&");
			String imgName = list.get(i).getLodgement_img().substring(0, su);
			list.get(i).setLodgement_img(imgName);
		}	
		return list;
	}
	
	@Override
	public int countLodgementApprovalStandbyListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.countLodgementApprovalStandbyList(searchVo);
	}

	@Override
	public void updateLodgementTempToApprovedService(int lodgement_number) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		adminpageDao.updateLodgementTempToApproved(lodgement_number);
	}
	
	//Manager
	@Override
	public List<ManagerVo> getManagerListService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getManagerList(searchVo);
	}
	
	@Override
	public int countManagerList(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao = sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.countManagerList(searchVo);
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

	@Override
	public int getUserNumberService(SearchVo searchVo) throws SQLException {
		AdminDao adminpageDao =sqlsession.getMapper(AdminDao.class);
		
		return adminpageDao.getUserNumber(searchVo);
	}

}
