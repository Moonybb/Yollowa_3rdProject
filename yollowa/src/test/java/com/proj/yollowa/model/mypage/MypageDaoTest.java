package com.proj.yollowa.model.mypage;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/resources/applicationContext.xml")
public class MypageDaoTest {
	
	@Inject
	SqlSession sqlSession;
	
	@Test
	public void lReservationInfoTest() throws SQLException {
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		List<LReservInfoDto> bean =myPageDao.getLreservationInfo(24);
		System.out.println(bean);
	}
	@Test
	public void lUserUsedInfoTest() throws SQLException {
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		List<LReservInfoDto> bean =myPageDao.getLuserCartInfo(24);
		
		System.out.println(bean);
	}
	@Test
	public void lUserCartInfoTest() throws SQLException {
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		List<LReservInfoDto> bean =myPageDao.getLuserCompletedInfo(24);
		
		System.out.println(bean);
	}
	@Test
	public void testString() throws SQLException{
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		UserVo userVo=myPageDao.userDetail(24);
		String awishList=userVo.getUser_aWishList();
		String[] userwish=awishList.split("&");
		for(String str:userwish) {
			System.out.println(str.trim());
			System.out.println(myPageDao.getAwishList(Integer.parseInt(str.trim())));
		}
	}
	
	@Test
	public void testReviewInfo() throws SQLException{
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		System.out.println(myPageDao.getLReviewInfo(1));
	}
	@Test
	public void testAverageStar() throws SQLException{
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		int[] list = myPageDao.getLStarPoint(15);
		double sum=0;
		for(int i=0;i<list.length;i++) {
			sum+=list[i];
		}
		sum=(int)(sum/list.length*10)/10.0;
		System.out.println(sum+" "+list.length+" ");
	}
	@Test
	public void testActivity() throws SQLException{
		MypageDao myPageDao = sqlSession.getMapper(MypageDao.class);
		System.out.println(myPageDao.getAreservationInfo(24));
		System.out.println(myPageDao.getAuserCartInfo(24));
		System.out.println(myPageDao.getAuserCartInfo(24));
	}
}

