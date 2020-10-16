package com.proj.yollowa.model.entity.admin;

public class HostrqnApprovalVo {
	
	int hostrqn_no;
	int hostrqn_userNo;
	String hostrqn_companyNumber;
	String hostrqn_companyName;
	int hostrqn_info;

	int user_number;
	String user_nickName;
	String user_name;
	int user_phoneNumber;
	String user_id;
	String user_email;
	String user_companyNumber;
	String user_companyName;
	String user_activityCompanyName;
	int user_level;
	
	public HostrqnApprovalVo() {
	}

	public HostrqnApprovalVo(int hostrqn_no, int hostrqn_userNo, String hostrqn_companyNumber,
			String hostrqn_companyName, int hostrqn_info, int user_number, String user_nickName, String user_name,
			int user_phoneNumber, String user_id, String user_email, String user_companyNumber, String user_companyName,
			String user_activityCompanyName, int user_level) {
		super();
		this.hostrqn_no = hostrqn_no;
		this.hostrqn_userNo = hostrqn_userNo;
		this.hostrqn_companyNumber = hostrqn_companyNumber;
		this.hostrqn_companyName = hostrqn_companyName;
		this.hostrqn_info = hostrqn_info;
		this.user_number = user_number;
		this.user_nickName = user_nickName;
		this.user_name = user_name;
		this.user_phoneNumber = user_phoneNumber;
		this.user_id = user_id;
		this.user_email = user_email;
		this.user_companyNumber = user_companyNumber;
		this.user_companyName = user_companyName;
		this.user_activityCompanyName = user_activityCompanyName;
		this.user_level = user_level;
	}

	public int getHostrqn_no() {
		return hostrqn_no;
	}

	public void setHostrqn_no(int hostrqn_no) {
		this.hostrqn_no = hostrqn_no;
	}

	public int getHostrqn_userNo() {
		return hostrqn_userNo;
	}

	public void setHostrqn_userNo(int hostrqn_userNo) {
		this.hostrqn_userNo = hostrqn_userNo;
	}

	public String getHostrqn_companyNumber() {
		return hostrqn_companyNumber;
	}

	public void setHostrqn_companyNumber(String hostrqn_companyNumber) {
		this.hostrqn_companyNumber = hostrqn_companyNumber;
	}

	public String getHostrqn_companyName() {
		return hostrqn_companyName;
	}

	public void setHostrqn_companyName(String hostrqn_companyName) {
		this.hostrqn_companyName = hostrqn_companyName;
	}

	public int getHostrqn_info() {
		return hostrqn_info;
	}

	public void setHostrqn_info(int hostrqn_info) {
		this.hostrqn_info = hostrqn_info;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public String getUser_nickName() {
		return user_nickName;
	}

	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_phoneNumber() {
		return user_phoneNumber;
	}

	public void setUser_phoneNumber(int user_phoneNumber) {
		this.user_phoneNumber = user_phoneNumber;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_companyNumber() {
		return user_companyNumber;
	}

	public void setUser_companyNumber(String user_companyNumber) {
		this.user_companyNumber = user_companyNumber;
	}

	public String getUser_companyName() {
		return user_companyName;
	}

	public void setUser_companyName(String user_companyName) {
		this.user_companyName = user_companyName;
	}

	public String getUser_activityCompanyName() {
		return user_activityCompanyName;
	}

	public void setUser_activityCompanyName(String user_activityCompanyName) {
		this.user_activityCompanyName = user_activityCompanyName;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	@Override
	public String toString() {
		return "HostrqnApprovalVo [hostrqn_no=" + hostrqn_no + ", hostrqn_userNo=" + hostrqn_userNo
				+ ", hostrqn_companyNumber=" + hostrqn_companyNumber + ", hostrqn_companyName=" + hostrqn_companyName
				+ ", hostrqn_info=" + hostrqn_info + ", user_number=" + user_number + ", user_nickName=" + user_nickName
				+ ", user_name=" + user_name + ", user_phoneNumber=" + user_phoneNumber + ", user_id=" + user_id
				+ ", user_email=" + user_email + ", user_companyNumber=" + user_companyNumber + ", user_companyName="
				+ user_companyName + ", user_activityCompanyName=" + user_activityCompanyName + ", user_level="
				+ user_level + "]";
	}
	
	
}
