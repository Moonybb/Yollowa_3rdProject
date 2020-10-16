package com.proj.yollowa.controller.host;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.host.AddLodgementPageDto;
import com.proj.yollowa.model.entity.host.LodgementUpdatePageDto;
import com.proj.yollowa.model.entity.host.LodgementVo;
import com.proj.yollowa.model.entity.host.RoomInfoVo;
import com.proj.yollowa.model.service.host.HostLodgementService;

@Controller
@RequestMapping("/host")
public class HostLodgementController {
	@Inject
	HostLodgementService hostService;
	
	// 호스트 인덱스 페이지
	@Auth
	@RequestMapping("/")
	public String hostIndex(@AuthUser UserVo userVo, Model model) throws SQLException {
		model.addAttribute("userName",userVo.getUser_name());
		return "host/hostIndex";
	}
	
	// 호스트 숙박 글 목록 페이지
	@Auth
	@RequestMapping("/lodgement")
	public String hostLodgement(@AuthUser UserVo userVo, Model model, HttpServletRequest req) throws SQLException {
		UserVo userBean = hostService.hostDetail(model, userVo.getUser_number());
		hostService.selectHostLodgementList(model, userBean);
		model.addAttribute("userVo", userBean);
		return "host/hostLodgement";
	}
	
	
	// 숙박 글 등록 페이지
	@Auth
	@RequestMapping(value="/ladd", method=RequestMethod.GET)
	public String laddPage(@AuthUser UserVo userVo, Model model) {
		// session에서 companyName get
		String user_companyName = userVo.getUser_companyName();
		
		// 페이지 상단 유저이름 출력
		model.addAttribute("userName",userVo.getUser_name());
		
		// 문자열로 들어온 user_companyName을 특정기호로 잘라 배열로 저장
		String[] companys = user_companyName.split("&");
		
		// model.addAttribute로 view에서 반복하여 출력하기 위해 ArrayList에 배열 길이만큼 add
		ArrayList<String> companyArray = new ArrayList<String>();;
		for(int i=0; i<companys.length; i++) {
			companyArray.add(companys[i]);
		}
		
		// 위에서 add한 리스트 모델에 실어 보냄
		model.addAttribute("companys", companyArray);
		
		return "host/addLodgement";
	}
	
	// 숙박 글 등록버튼 클릭 시 post 
	@Auth
	@RequestMapping(value="/ladd", method=RequestMethod.POST)
	public String addLadgement(@AuthUser UserVo userVo, AddLodgementPageDto bean, HttpServletRequest req) throws SQLException, IllegalStateException, IOException {
		System.out.println("입력받은 숙박 글 : "+bean);
		
		// Lodgement Insert 숙박 게시글 정보가 등록 lodgement_img는 제외
		hostService.insertLodgement(userVo.getUser_number(), bean);
		
		// 위에서 insert 된 lodgement_number 값을 select (information 테이블에 같이 넣어줘야 하고 titleImg도 파싱해서 넣어줘야 함) 
		int lodgementNumber = hostService.selectLodgementNumber(userVo.getUser_number(), bean);
		System.out.println("숙박 insert된 글의 번호 select :: "+lodgementNumber);
		
		// 타이틀 이미지들 처리 업로드
		String lodgement_img = hostService.uploadLodgementImg(bean, lodgementNumber, req);
		
		// 위에서 업로드와 동시에 파싱된 lodgement_img update 
		hostService.updateLodgementImg(lodgementNumber, lodgement_img);
		
		// information insert  숙박 글번호와 함께 사장님 한마디, 공지사항, 기본정보, 인원 추가정보, 편의시설 및 서비스, 취소 및 환불규정
		hostService.insertLodgeInfo(lodgementNumber, bean);
		
		return "redirect:/host/lodgement";
	}

	// 숙박 글 삭제 (숙박 글에 달려있는 방들도 삭제)
	@Auth
	@RequestMapping(value="lodgeDelete/{lodgement_number}")
	public String deleteHostLodgement(@PathVariable("lodgement_number") int lodgement_number) {
		// 숙박 글 삭제
		hostService.deleteHostLodgement(lodgement_number);
		
		// 해당 글에 등록된 방 삭제
		hostService.deleteHostLodgeRoom(lodgement_number);
		
		return "redirect:/host/lodgement";
	}
	
	// 숙박 글 수정완료 버튼 클릭 시 post
	@Auth
	@RequestMapping(value="/lodgeUpdate/{lodgement_number}", method=RequestMethod.POST)
	public String updateHostLodgement(@AuthUser UserVo userVo, @PathVariable("lodgement_number") int lodgement_number, LodgementUpdatePageDto bean, HttpServletRequest req) throws SQLException, IllegalStateException, IOException {
		
		hostService.updateHostLodgement(lodgement_number, bean, req);
		
		return "redirect:/host/lodgement";
	}
	
	// 해당 숙박 글에 등록된 방 리스트페이지
	@Auth
	@RequestMapping(value="/lodgeRoom/{lodgement_number}", method=RequestMethod.GET)
	public String lodgementRoomsPage(@PathVariable("lodgement_number") int lodgement_number, @AuthUser UserVo userVo, Model model) throws SQLException {
		
		// host/lodgeRoom -> 유저넘버를 보내 lodgement table에 해당 유저번호로 등록 된 글이 있으면 lodgement_number return
		ArrayList<LodgementVo> matchUserNumber = hostService.hostNumberMatch(userVo.getUser_number());
		
		if(matchUserNumber!=null) {
			// 호스트 이름 
			model.addAttribute("userName", userVo.getUser_name());
			// 숙박글 번호 -> 방추가하기로 넘길 때 필요
			model.addAttribute("lodgement_number", lodgement_number);
			// 컴퍼니 네임 select
			hostService.selectLodgementName(lodgement_number, model);
			// 등록 된 방
			hostService.selectLodgementRooms(lodgement_number, model);
			
			return "host/lodgementRooms";
		}else {
			return "home";
		}
		
	}
	
	// 숙박 글의 룸 리스트 페이지에서 방 추가 페이지로 이동
	@Auth
	@RequestMapping(value="/addRoom/{lodgement_number}", method=RequestMethod.GET)
	public String addRoomPage(@PathVariable("lodgement_number") int lodgement_number, @AuthUser UserVo userVo, Model model) throws SQLException {
		
		// host/addRoom -> 유저넘버를 보내 lodgement table에 해당 유저번호로 등록 된 글이 있으면 lodgement_number return
		ArrayList<LodgementVo> matchUserNumber = hostService.hostNumberMatch(userVo.getUser_number());
		if(matchUserNumber!=null) {
			// 컴퍼니 네임 select
			model.addAttribute("hostName", userVo.getUser_name());
			model.addAttribute("lodgement_number", lodgement_number);
			hostService.selectLodgementName(lodgement_number, model);
			
			return "host/addRoom";
		}else {
			return "home";
		}
	}
	
	// 방 추가 post
	@Auth
	@RequestMapping(value="/addRoom/addRoomAction/{lodgement_number}", method=RequestMethod.POST)
	public String addRoomAction(@PathVariable("lodgement_number") int lodgement_number, RoomInfoVo bean, HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println(bean);
	
		// articleNumber set
		bean.setRoomInfo_articleNumber(lodgement_number);
		
		// insert roomInfo (이미지 제외)
		hostService.insertLodgementRoom(bean);
		
		// 위에서 insert 되면서 생성된 roomNumber select
		// 숙박 글번호와 방이름으로 매치 
		int roomNumber = hostService.selectRoomInfo_RoomNumber(bean.getRoomInfo_articleNumber(),bean.getRoomInfo_name());
		System.out.println("등록된 roomNumber :: "+roomNumber);
		
		// img upload & parsing
		// 이미지가 업로드 될때 방번호를 가지고 생성되기 때문에 위에서 먼저 방 insert 를한 후에 업로드처리한다.
		String setImgName = hostService.uploadRoomInfoImg(bean, roomNumber, req);
		System.out.println("데이터베이스 update RoomImg :: "+setImgName);
		
		// 위에서 리턴받은 파싱된 이미지 String update
		hostService.updateRoomInfoImg(bean.getRoomInfo_articleNumber(), roomNumber, setImgName);
		
		return "redirect:/host/lodgeRoom/"+lodgement_number;
	}
	
	
	// lodgeRoom -> 방 삭제
	@Auth
	@RequestMapping(value="/removeRoom/{roomArticleNumber}/{roomNumber}")
	public String removeRoom(@PathVariable("roomArticleNumber") int articleNumber, @PathVariable("roomNumber") int roomNumber) {
		
		hostService.deleteRoom(articleNumber,roomNumber);
		
		
		// 해당 펜션의 방 리스트로 보냄
		return "redirect:/host/lodgeRoom/"+articleNumber;
	}
}