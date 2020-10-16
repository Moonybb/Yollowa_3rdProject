package com.proj.yollowa.model.entity;

import java.sql.Date;

public class UserVo {
	private int user_number;
	private String user_nickName;
	private String user_name;
	private Date user_birthday;
	private String user_gender;
	private String user_phoneNumber;
	private String user_address;
	private String user_id;
	private String user_password;
	private String user_email;
	private String user_likes;
	private String user_aWishList;
	private String user_lWishList;
	private String user_companyNumber;
	private String user_companyName;
	private String user_activityCompanyName;
	private int user_level;
	private String user_googleId;
	private String user_naverId;
	private String user_kakaoId;
	
	public UserVo() {
	}

	public UserVo(int user_number, String user_nickName, String user_name, Date user_birthday, String user_gender,
			String user_phoneNumber, String user_address, String user_id, String user_password, String user_email,
			String user_likes, String user_aWishList, String user_lWishList, String user_companyNumber,
			String user_companyName, String user_activityCompanyName, int user_level, String user_googleId,
			String user_naverId, String user_kakaoId) {
		super();
		this.user_number = user_number;
		this.user_nickName = user_nickName;
		this.user_name = user_name;
		this.user_birthday = user_birthday;
		this.user_gender = user_gender;
		this.user_phoneNumber = user_phoneNumber;
		this.user_address = user_address;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_likes = user_likes;
		this.user_aWishList = user_aWishList;
		this.user_lWishList = user_lWishList;
		this.user_companyNumber = user_companyNumber;
		this.user_companyName = user_companyName;
		this.user_activityCompanyName = user_activityCompanyName;
		this.user_level = user_level;
		this.user_googleId = user_googleId;
		this.user_naverId = user_naverId;
		this.user_kakaoId = user_kakaoId;
	}

	@Override
	public String toString() {
		return "UserVo [user_number=" + user_number + ", user_nickName=" + user_nickName + ", user_name=" + user_name
				+ ", user_birthday=" + user_birthday + ", user_gender=" + user_gender + ", user_phoneNumber="
				+ user_phoneNumber + ", user_address=" + user_address + ", user_id=" + user_id + ", user_password="
				+ user_password + ", user_email=" + user_email + ", user_likes=" + user_likes + ", user_aWishList="
				+ user_aWishList + ", user_lWishList=" + user_lWishList + ", user_companyNumber=" + user_companyNumber
				+ ", user_companyName=" + user_companyName + ", user_activityCompanyName=" + user_activityCompanyName
				+ ", user_level=" + user_level + ", user_googleId=" + user_googleId + ", user_naverId=" + user_naverId
				+ ", user_kakaoId=" + user_kakaoId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((user_aWishList == null) ? 0 : user_aWishList.hashCode());
		result = prime * result + ((user_activityCompanyName == null) ? 0 : user_activityCompanyName.hashCode());
		result = prime * result + ((user_address == null) ? 0 : user_address.hashCode());
		result = prime * result + ((user_birthday == null) ? 0 : user_birthday.hashCode());
		result = prime * result + ((user_companyName == null) ? 0 : user_companyName.hashCode());
		result = prime * result + ((user_companyNumber == null) ? 0 : user_companyNumber.hashCode());
		result = prime * result + ((user_email == null) ? 0 : user_email.hashCode());
		result = prime * result + ((user_gender == null) ? 0 : user_gender.hashCode());
		result = prime * result + ((user_googleId == null) ? 0 : user_googleId.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((user_kakaoId == null) ? 0 : user_kakaoId.hashCode());
		result = prime * result + ((user_lWishList == null) ? 0 : user_lWishList.hashCode());
		result = prime * result + user_level;
		result = prime * result + ((user_likes == null) ? 0 : user_likes.hashCode());
		result = prime * result + ((user_name == null) ? 0 : user_name.hashCode());
		result = prime * result + ((user_naverId == null) ? 0 : user_naverId.hashCode());
		result = prime * result + ((user_nickName == null) ? 0 : user_nickName.hashCode());
		result = prime * result + user_number;
		result = prime * result + ((user_password == null) ? 0 : user_password.hashCode());
		result = prime * result + ((user_phoneNumber == null) ? 0 : user_phoneNumber.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserVo other = (UserVo) obj;
		if (user_aWishList == null) {
			if (other.user_aWishList != null)
				return false;
		} else if (!user_aWishList.equals(other.user_aWishList))
			return false;
		if (user_activityCompanyName == null) {
			if (other.user_activityCompanyName != null)
				return false;
		} else if (!user_activityCompanyName.equals(other.user_activityCompanyName))
			return false;
		if (user_address == null) {
			if (other.user_address != null)
				return false;
		} else if (!user_address.equals(other.user_address))
			return false;
		if (user_birthday == null) {
			if (other.user_birthday != null)
				return false;
		} else if (!user_birthday.equals(other.user_birthday))
			return false;
		if (user_companyName == null) {
			if (other.user_companyName != null)
				return false;
		} else if (!user_companyName.equals(other.user_companyName))
			return false;
		if (user_companyNumber != other.user_companyNumber)
			return false;
		if (user_email == null) {
			if (other.user_email != null)
				return false;
		} else if (!user_email.equals(other.user_email))
			return false;
		if (user_gender == null) {
			if (other.user_gender != null)
				return false;
		} else if (!user_gender.equals(other.user_gender))
			return false;
		if (user_googleId == null) {
			if (other.user_googleId != null)
				return false;
		} else if (!user_googleId.equals(other.user_googleId))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_kakaoId == null) {
			if (other.user_kakaoId != null)
				return false;
		} else if (!user_kakaoId.equals(other.user_kakaoId))
			return false;
		if (user_lWishList == null) {
			if (other.user_lWishList != null)
				return false;
		} else if (!user_lWishList.equals(other.user_lWishList))
			return false;
		if (user_level != other.user_level)
			return false;
		if (user_likes == null) {
			if (other.user_likes != null)
				return false;
		} else if (!user_likes.equals(other.user_likes))
			return false;
		if (user_name == null) {
			if (other.user_name != null)
				return false;
		} else if (!user_name.equals(other.user_name))
			return false;
		if (user_naverId == null) {
			if (other.user_naverId != null)
				return false;
		} else if (!user_naverId.equals(other.user_naverId))
			return false;
		if (user_nickName == null) {
			if (other.user_nickName != null)
				return false;
		} else if (!user_nickName.equals(other.user_nickName))
			return false;
		if (user_number != other.user_number)
			return false;
		if (user_password == null) {
			if (other.user_password != null)
				return false;
		} else if (!user_password.equals(other.user_password))
			return false;
		if (user_phoneNumber == null) {
			if (other.user_phoneNumber != null)
				return false;
		} else if (!user_phoneNumber.equals(other.user_phoneNumber))
			return false;
		return true;
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

	public Date getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phoneNumber() {
		return user_phoneNumber;
	}

	public void setUser_phoneNumber(String user_phoneNumber) {
		this.user_phoneNumber = user_phoneNumber;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_likes() {
		return user_likes;
	}

	public void setUser_likes(String user_likes) {
		this.user_likes = user_likes;
	}

	public String getUser_aWishList() {
		return user_aWishList;
	}

	public void setUser_aWishList(String user_aWishList) {
		this.user_aWishList = user_aWishList;
	}

	public String getUser_lWishList() {
		return user_lWishList;
	}

	public void setUser_lWishList(String user_lWishList) {
		this.user_lWishList = user_lWishList;
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

	public String getUser_googleId() {
		return user_googleId;
	}

	public void setUser_googleId(String user_googleId) {
		this.user_googleId = user_googleId;
	}

	public String getUser_naverId() {
		return user_naverId;
	}

	public void setUser_naverId(String user_naverId) {
		this.user_naverId = user_naverId;
	}

	public String getUser_kakaoId() {
		return user_kakaoId;
	}

	public void setUser_kakaoId(String user_kakaoId) {
		this.user_kakaoId = user_kakaoId;
	}

	
}
