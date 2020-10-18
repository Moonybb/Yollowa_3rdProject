package com.proj.yollowa.model.user;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.login.LoginVo;

public interface UserDao {
	
	List<UserVo> selectAll() throws SQLException;
	UserVo login(LoginVo loginVo) throws SQLException;
//	<select id="kakaoId" resultType="java.lang.String">
//	select user_kakaoId from user
//</select>
//<select id="naverId" resultType="java.lang.String">
//	select user_naverId from user
//</select>
//<select id="getKakaoUserInfo" resultType="com.proj.yollowa.model.entity.UserVo">
//	select * from user where user_kakaoId=#{user_kakaoId}
//</select>
//<select id="getNaverUserInfo" resultType="com.proj.yollowa.model.entity.UserVo">
//	select * from user where user_naverId=#{user_naverId}
//</select>
	List<String> getKakaoId() throws SQLException;
	List<String> getNaverId() throws SQLException;
	UserVo getKakaoUserInfo(String kakaoId) throws SQLException;
	UserVo getNaverUserInfo(String naverId) throws SQLException;
	List<UserVo> getUserInfo() throws SQLException;
	void insertUser(@Param("user") UserVo userVo) throws SQLException;
	List<String> getUserNickName() throws SQLException;
	void insertKakaoUser(@Param("user") UserVo userVo) throws SQLException;
	void insertNaverUser(@Param("user") UserVo userVo) throws SQLException;
	UserVo getUser(int user_Number) throws SQLException;
	
	
}
