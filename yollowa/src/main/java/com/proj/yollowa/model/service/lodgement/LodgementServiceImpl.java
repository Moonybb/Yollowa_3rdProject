package com.proj.yollowa.model.service.lodgement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementDetailPageDto;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.lodgement.LodgementDao;

@Service
public class LodgementServiceImpl implements LodgementService {

	@Inject
	SqlSession sqlSession;
	
	// 숙박 리스트
	@Override
	public List<LodgementVo> lodgementListAll(Model model) throws SQLException {
		LodgementDao dao =sqlSession.getMapper(LodgementDao.class);
		List<LodgementVo> alist= dao.lodgementListAll();
		
		List<LodgementVo> list= dao.lodgementListAll();
		for(int i=0; i<list.size(); i++) {
			int su = list.get(i).getLodgement_img().indexOf("&");
			String imgName = list.get(i).getLodgement_img().substring(0, su);
			list.get(i).setLodgement_img(imgName);
		}
		model.addAttribute("listAll",list);
		
		return alist;
	}

	// 숙박 리스트 temp=1인 전체 개수
	@Override
	public int lodgementListCnt() throws SQLException {
		LodgementDao dao=sqlSession.getMapper(LodgementDao.class);
		int cnt =dao.lodgementListCnt();
		return cnt;
	}

	// 숙박 디테일
	@Override
	public List<LodgementDetailPageDto> lodgementDetail(int articleNumber, Model model) throws SQLException {
		LodgementDao dao=sqlSession.getMapper(LodgementDao.class);
		List<LodgementDetailPageDto> list = dao.lodgementDetail(articleNumber);
		
//		for(int i=0; i<list.size(); i++) {
//			int su = list.get(i).getRoomInfo_img().indexOf("&");
//			String imgName = list.get(i).getRoomInfo_img().substring(0, su);
//			list.get(i).setRoomInfo_img(imgName);
//		}
		model.addAttribute("detailList",list);
		return list;
	}

	@Override
	public void lodgementImgSelect(int number, Model model) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		String titleImg = dao.lodgementImgSelect(number);
		model.addAttribute("listImg", titleImg);
	}
	
	// ajax select Price (lodgement list page)
	@Override
	public int priceSelect(int lodgementNumber) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		List<LodgementRoomInfoVo> list = dao.priceSelect(lodgementNumber);
//		System.out.println("service return list :: "+list);
		
		int price = list.get(0).getRoomInfo_offPeakPrice();
//		System.out.println(lodgementNumber+"의 방 가격"+price);
		
		return price;
	}
	
	
	// lodgement list page search
	@Override
	public void lodgementSearch(String search, Model model) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		List<LodgementVo> list = dao.lodgementSearch(search);
		
		for(int i=0; i<list.size(); i++) {
			int su = list.get(i).getLodgement_img().indexOf("&");
			String imgName = list.get(i).getLodgement_img().substring(0, su);
			list.get(i).setLodgement_img(imgName);
		}
		
		model.addAttribute("listAll", list);
	}

	
	// 숙박 디테일 기본정보
	@Override
	public List<InformationVo> lodgementInfo(int number, int type,Model model) throws SQLException {
		LodgementDao dao= sqlSession.getMapper(LodgementDao.class);
		List<InformationVo> list= dao.lodgementInfo(number,type);
		
		model.addAttribute("infoList",list);
		return list;
	}

	// 숙박 예약 지정된 방 정보
	@Override
	public List<LodgementRoomInfoVo> lodgementReserInfo(int articleNumber, int roomNumber, Model model) throws SQLException{
		LodgementDao dao= sqlSession.getMapper(LodgementDao.class);
		List<LodgementRoomInfoVo> list =dao.lodgementReserInfo(articleNumber, roomNumber);
		model.addAttribute("reserInfo", list);
		
		return list;
	}
	
	// insert 하기 전에 받아온 정보들로 roomInfo에서 날짜 상대적으로 가격을 받아낸다 (시작날짜 기준)
	@Override
	public int roomPaymentSelect(int roomNumber, Date startDate, Date endDate) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		
		// 먼저 성수기, 비성수기 날자를 받아온 후 가져온 startDate가 성수기인지 비성수기인지 비교
		Date peakStartDate = dao.roomPeakStartDateSelect(roomNumber);
		Date peakEndDate = dao.roomPeakEndDateSelect(roomNumber);
		System.out.println("성수기 시작 :: "+peakStartDate);
		System.out.println("성수기 종료 :: "+peakEndDate);
		
		// 성수기 시작날짜와 비교해서 시작날짜보다 크면 양수 작으면 음수
		int compare1 = startDate.compareTo(peakStartDate);
		
		// 성수기 종료날짜와 비교해서 종료날짜보다 크면 양수 작으면 음수
		int compare2 = startDate.compareTo(peakEndDate);
		
		// 아래에서 성수기면 해당 방의 성수기가격을, 비성수기면 비성수기 가격을 select
		int payment;
		if(compare1>0 && compare2<0) {
			payment = dao.selectPeakPayment(roomNumber);
			System.out.println("사용자가 체크한 날짜는 성수기, 가격 ::"+payment);
		}else {
			payment = dao.selectOffPeakPayment(roomNumber) ;
			System.out.println("사용자가 체크한 날짜는 비성수기, 가격 ::"+payment);
		}
		
		return payment;
	}
	
	// 숙박 장바구니 ajax insert
	@Override
	public void lodgementCartInsert(int articleNumber, int roomNumber, Date startDate, Date endDate, int payment, UserVo userVo) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		dao.lodgementCartInsert(articleNumber, roomNumber, startDate, endDate, payment, userVo);
		
	}

	// 숙박 찜목록 ajax insert
	@Override
	public void lodgementWishUpdate(int lodgementNumber, int userNumber) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		
		// 먼저 userNumber로 본인 wish 리스트를 가져와 null이면 그냥 번호만 이미 있는 찜목록이 있으면 & 붙여 update
		String existWishList = dao.lodgementUserWishSelect(userNumber);
		
		if(existWishList==null) {
			// 기존에 등록된 찜 목록이 없을 때 그냥 update
			System.out.println("기존에 등록된 wish없음");
			dao.notExistWishUpdate(lodgementNumber, userNumber);
		}else {
			// 중복 검사
			String arr[] = existWishList.split("&");
			for(int i=0; i<arr.length; i++) {
				if(arr[i].contains(""+lodgementNumber)) {
					System.out.println("번호 중복");
					// &로 스플릿한 배열 요소중에 가져온 lodgementNumber가 있으면 들어옴
					return;
				}
			}
			// 중복검사에 걸리지 않았을 때
			// 기존에 등록된 찜 목록이 있을 때 기존 + & 숙박글번호
			String afterWish = existWishList+"&"+lodgementNumber;
			dao.afterWishUpdate(afterWish, userNumber);
			System.out.println("기존에 등록된 wish 있음");
			
		}
		
	}
	
	
	// 지역필터
	@Override
	public void lodgementLocationFilterSelect(String locationFilter, Model model) {
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		
		// '/'로 나눠져있을 수 있기 떄문에 /로 split
		if(locationFilter.contains("/")) {
			String[] filterSplitArr = locationFilter.split("/");
			List<LodgementVo> list = new ArrayList<LodgementVo>();
			
			int cnt =0;
			
			for(int i=0; i<filterSplitArr.length; i++) {
				// 스플릿돼서 나온 배열 length만큼 돌려 list에 담아놓고 위에 만들어 놓은 list 각각의 요소를 다시 add
				List<LodgementVo> tempList = dao.selectLocationFilterOne(filterSplitArr[i]);
				
				// 누적할 검색 건수 누적
				cnt += dao.selectLocationFilterOneCnt(locationFilter);
				
				// 위에서 나온 list의 안의 요소를 위에 만들어놓은 list에 각각 add
				for(int j=0; j<tempList.size(); j++) {

					// list에 각각 add
					list.add(tempList.get(j));
				}	
			}
			model.addAttribute("filterCnt", cnt);
			
			for(int i=0; i<list.size(); i++) {
				int su = list.get(i).getLodgement_img().indexOf("&");
				String imgName = list.get(i).getLodgement_img().substring(0, su);
				list.get(i).setLodgement_img(imgName);
			}
			
			model.addAttribute("listAll",list);
			
		}else {
			// 전체 선택시 걸러주기
			if(locationFilter.contains("전체")) {
				String splitAll = locationFilter.replaceAll(" 전체", "");
				
				List<LodgementVo> list = dao.selectLocationFilterOne(splitAll);
				
				// 검색 건수를 알려주기 위해 count 요청
				int cnt = dao.selectLocationFilterOneCnt(splitAll);
				model.addAttribute("filterCnt", cnt);
				
				for(int i=0; i<list.size(); i++) {
					int su = list.get(i).getLodgement_img().indexOf("&");
					String imgName = list.get(i).getLodgement_img().substring(0, su);
					list.get(i).setLodgement_img(imgName);
				}
				
				model.addAttribute("listAll",list);
				
				// 리턴시켜버림
				return;
			}
				
			// '/'로 나눠져있지 않은 것은 바로 보냄
			List<LodgementVo> list = dao.selectLocationFilterOne(locationFilter);
			
			// 검색 건수를 알려주기 위해 count 요청
			int cnt = dao.selectLocationFilterOneCnt(locationFilter);
			model.addAttribute("filterCnt", cnt);
			
			for(int i=0; i<list.size(); i++) {
				int su = list.get(i).getLodgement_img().indexOf("&");
				String imgName = list.get(i).getLodgement_img().substring(0, su);
				list.get(i).setLodgement_img(imgName);
			}
			
			model.addAttribute("listAll",list);
		}
		
	}

	//숙박 유저정보
	@Override
	public UserVo lodgementReserUser(UserVo user, Model model) throws SQLException {
		LodgementDao dao= sqlSession.getMapper(LodgementDao.class);
		UserVo userBean=dao.lodgementReserUser(user.getUser_number());
		
		
		return userBean;
	}

	//숙박 선택한 방 성수기 날자
	@Override
	public LodgementRoomInfoVo lodgementpeakDays(int articleNumber, int roomNumber, Model model) throws SQLException {
		LodgementDao dao =sqlSession.getMapper(LodgementDao.class);
		LodgementRoomInfoVo dayBean=dao.lodgementpeakDays(articleNumber,roomNumber);
		return dayBean;
	}

	// 결제 성공시 예약정보에 insert (바로구매)
	@Override
	public void LReservInfoInsert(int userNumber, int articleNumber, int roomNumber, java.sql.Date checkIn,
			java.sql.Date checkOut, String userPhoneNumber, int resultPrice) {
		
		LodgementDao dao = sqlSession.getMapper(LodgementDao.class);
		
		
		dao.LReservInfoInsert(userNumber,articleNumber,roomNumber,checkIn,checkOut,userPhoneNumber,resultPrice);
		
	}

	//결제 성공시 예약정보 update (장바구니 결제)
	@Override
	public void LReservInfoUpdate(int c) {
		LodgementDao dao=sqlSession.getMapper(LodgementDao.class);
		dao.LReservInfoUpdate(c);
		
	}

}
