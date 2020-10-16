package com.proj.yollowa.model.host;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.proj.yollowa.model.entity.host.AddLodgementPageDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/resources/applicationContext.xml")
public class HostDaoTest {
	@Inject
	SqlSession sqlSession;
	
	
	@Test
	public void testSelectDetail() throws SQLException {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		System.out.println(hostDao.userDetail(1));
	}
	
	@Test
	public void testInsertLodgement() {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		AddLodgementPageDto dto = new AddLodgementPageDto();
		dto.setLodgement_category("pension");
		dto.setLodgement_hashTag("태그1&태그2");
		dto.setLodgement_img("hotel1.jpg&hotel2.jpg");
		//dto.setLodgement_LatLng("경도 위도");
		dto.setLodgement_location("위치");
		dto.setLodgement_companyName("신라호텔");
		System.out.println(dto);
		
		hostDao.insertLodgement(1, dto);
	}

	@Test
	public void testSelectLodgementNum() {
		HostDao hostDao = sqlSession.getMapper(HostDao.class);
		AddLodgementPageDto dto = new AddLodgementPageDto();
		dto.setLodgement_companyName("신라호텔");
		dto.setLodgement_category("hotel");
		dto.setLodgement_location("서울특별시");
		System.out.println(dto);
		int lodgementNumber = hostDao.selectLodgementNum(1, dto);
		System.out.println(lodgementNumber);
	}

}
