package org.hdcd.controller.manager.lecture_manage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.manager.lecture.ILecOpenManagementService;
import org.hdcd.vo.AssignRoomVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LectureRoomVO;
import org.hdcd.vo.LectureVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/loMng")
public class LectureManagementController {
	
	@Inject
	private ILecOpenManagementService service;
	
	/**
	 * 민지
	 * 관리자 개설신청 관리 페이지 열기
	 * 강의실번호 넘기기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/lecOpenManagementList")
	public String lecOpenManagement(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<Map<String, Object>> roomList = service.selectRoomList();
		
		log.debug(""+roomList);
		
		model.addAttribute("roomList", roomList);
		
		return "manager/lectureOpenManagementList";
	}
	
	/**
	 * 민지 
	 * 개설신청 리스트 뿌리기
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/lecOpenApplyList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> lecOpenApplyList() throws Exception {
		
		List<Map<String, Object>> map = service.selectLecOpenApplyList();
		
		return map;
	}
	
	/**
	 * 민지 반려사유 내용 보기
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getlolRejectContent", produces = "application/json;charset=utf-8")
	public String getlolRejectContent(@RequestBody Map<String, String> map) throws Exception {
		
		log.debug("lolCode 찍기 " + map.get("lolCode"));
		String lolCode = map.get("lolCode");
		
		LecOpenListVO lolVO = service.selectRejectContent(lolCode);
		log.debug("lolVO찍기 " + lolVO.getLol_reject());
		
		String lolReject =  lolVO.getLol_reject();
		
		return lolReject;
	}
	
	/**
	 * 민지
	 * 강의 개설 신청서 관리자 내용 보기
	 * @param lolCode
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/lecOpenApplyContents/{lolCode}")
	public String lecOpenApplyContents(@PathVariable String lolCode, Model model) throws Exception {
		
		log.debug("lolCode 출력~~ : " + lolCode);
		
		Map<String, Object> map = service.selectAllLecOpenApplyContents(lolCode);
		
		log.debug("값 => " + map);
		
		model.addAttribute("dataMap", map);
		
		return "manager/detailPopUp/lolApplyContens";
	}
	
	/**
	 * 민지
	 * 개설신청 승인하기
	 * @param mapData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/lecOpenAcceptManage")
	public String lecOpenAcceptManage(@RequestBody Map<String, String> mapData) throws Exception {
		
		log.debug("lolCode 출력해보기 ===>>"+ mapData.get("lolCode"));
		
		String lol_code = mapData.get("lol_code");
		String room_code = mapData.get("room_code");
		
		AssignRoomVO assignRoom = new AssignRoomVO();
		assignRoom.setRoom_code(room_code);
		
//		assignRoom
//		selectKey 로  assign_code 리턴 받음

		service.insertAssignRoom(assignRoom);

		String assign_code = assignRoom.getAssign_code();
		
		log.debug("일단 인서트 출력 "+ assign_code);
		
		LectureVO lectureVO = new LectureVO();
		
		lectureVO.setAssign_code(assign_code);
		lectureVO.setLol_code(lol_code);

		service.insertLecture(lectureVO);
		
		service.updateLecOpenListState(lol_code);
		
		
		return "OK";
	}
	
	/**
	 * 민지
	 * 개설신청 반려하기
	 * @param lecOpenListVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/lecOpenRejectManage")
	public String lecOpenRejectManage(@RequestBody LecOpenListVO lecOpenListVO) throws Exception {
		
		log.debug(""+lecOpenListVO);
		
		int cnt = service.updateLecOpenListStateNReject(lecOpenListVO);
		
		if(cnt > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
	
	
}
