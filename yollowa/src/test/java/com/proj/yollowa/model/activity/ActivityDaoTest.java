package com.proj.yollowa.model.activity;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.proj.yollowa.model.activity.ActivityDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/resources/applicationContext.xml")
public class ActivityDaoTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void testActivitySelectAll() throws SQLException {
		
	}
//	
//	@Test
//	public void testActivityOption() throws SQLException{
//		ActivityDao dao=sqlSession.getMapper(ActivityDao.class);
//		System.out.println(dao.optionList());
//		
//	}
}








