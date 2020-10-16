package com.proj.yollowa.model.service.host;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.host.ActivityOptionVo;
import com.proj.yollowa.model.entity.host.ActivityUpdatePageDto;
import com.proj.yollowa.model.entity.host.ActivityVo;
import com.proj.yollowa.model.entity.host.AddActivityPageDto;

public interface HostActivityService {

	// host/ -> 사업자 액티비티글 리스트
	void selectHostLodgementList(Model model, UserVo userVo) throws SQLException;

	
	// Lodgement Insert 액티비티 게시글 정보가 등록 lodgement_img는 제외
	void insertActivity(int user_number, AddActivityPageDto bean) throws SQLException;

	// 위에서 insert 된 lodgement_number 값을 select (information 테이블에 같이 넣어줘야 하고 titleImg도 파싱해서 넣어줘야 함) 
	int selectActivityNumber(int user_number, AddActivityPageDto bean);

	// 타이틀 이미지들 처리 업로드
	String uploadActivityImg(AddActivityPageDto bean, int activityNumber, HttpServletRequest req) throws SQLException, IllegalStateException, IOException;

	// 위에서 업로드와 동시에 파싱된 lodgement_img update 
	void updateActivityImg(int activityNumber, String activity_img);

	// information insert 액티비티 글번호와 함께 사장님 한마디, 공지사항, 기본정보, 인원 추가정보, 편의시설 및 서비스, 취소 및 환불규정
	void insertActivityInfo(int activityNumber, AddActivityPageDto bean);

	// host/activity - 자신이 쓴 액티비티 글 보기
	void selectHostActivityList(Model model, UserVo userVo);

	// 액티비티 글 수정
	// host/activityUpdate/number 
	void updateHostActivity(int activity_number, ActivityUpdatePageDto bean, HttpServletRequest req) throws IllegalStateException, IOException;

	// 액티비티 글 삭제
	// host/activityDelete/number
	void deleteHostActivity(int activity_number);
	// 위와 함꼐 해당 글에 등록된 액티비티옵션 삭제
	void deleteHostActivityOption(int activity_number);

	// host/activityOptions -> 유저넘버를 보내 activityOption table에 해당 유저번호로 등록 된 글이 있으면 activity_number return
	ArrayList<ActivityVo> hostNumberMatch(int user_number);

	// host/activityOptions -> title select
	void selectActivityName(int activity_number, Model model);

	// host/activityOptions -> title select
	void selectActivityOptions(int activity_number, Model model);

	// removeOption/{activity_articleNumber}/{activity_optionNumber} -> 액티비티 옵션 삭제
	void deleteOption(int articleNumber, int optionNumber);


	// /addOption/addOptionAction/ -> 액티비티 옵션 등록
	void insertActivityOption(ActivityOptionVo optionBean);
	
	
}
