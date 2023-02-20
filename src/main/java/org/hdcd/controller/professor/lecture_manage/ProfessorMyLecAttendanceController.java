package org.hdcd.controller.professor.lecture_manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.professor.IProMyLecAttendService;
import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendanceVO;
import org.hdcd.vo.StudentVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lad")
public class ProfessorMyLecAttendanceController {

	@Inject
	private IProMyLecAttendService service;
	
	@GetMapping("/pMyOpenLecList")
	public String pMyOpenLecList() {
		return "professor/pMyOpenLecList";
	}
	
	/**
	 * 민지
	 * 내 개설강좌
	 * @return
	 */
	@ResponseBody
	@GetMapping(value = "/getMyOpenLecList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getMyOpenLecList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		log.debug("userId 찍어보기!!!!" + userId);
		
		List<Map<String, Object>> list = service.selectMyOpenLecList(userId);
		
		log.debug("list 찍기..!!!" + list);
		
		return list;
	}
	
	/**
	 * 민지
	 * 강좌별 수강생 페이지 열기(select 옵션값 강좌 불러오기)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/pMyOpenLecStudentList")
	public String pMyOpenLecStudentList(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> lecList = service.selectMyLecNameNCode(userId);
		
		log.debug("리스트 뽑기 디버깅~~ " + lecList);
		
		model.addAttribute("lecture",lecList);
		
		return "professor/pMyOpenLecStudentList";
	}
	
	/**
	 * 민지
	 * 강좌별 학생 리스트 뽑기
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/myLecStudentList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getLecStudentList(@RequestBody Map<String, String> map) throws Exception{
		
		String lec_code = map.get("lec_code");
		
		List<Map<String, Object>> stuList = service.selectLecStudentList(lec_code);

		return stuList;
		
	}
	
	/**
	 * 민지
	 * 학생별 정보
	 * @param studentVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getMyLecStudentInfo", produces = "application/json;charset=utf-8")
	public Map<String, Object> getMyLecStudentInfo(@RequestBody StudentVO studentVO) throws Exception {
		
		Map<String, Object> mapData = service.selectLecStudentInfo(studentVO);
		
		return mapData;
	}
//=============================================================================여기까지 강좌별수강생
	
	/**
	 * 민지
	 * 출석부 관리 페이지 열기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/myLecStuentAttend")
	public String myLecStuentAttend(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> list = service.selectMyLecNameNCode(userId);
		
		model.addAttribute("lecture", list);
		
		return "professor/pMyStudentAttend";
	}
	
	/**
	 * 민지
	 * 출석부관리 강의별 주차 리스트 띄우기
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@PostMapping(value = "/getMyOpenLecWeektList", produces = "application/json;charset=utf-8")
	public Map<String, Object> getMyOpenLecWeektList(@RequestBody Map<String, String> map) throws Exception{
		String lolCode = map.get("lolCode");
		
		Map<String, Object> weekList = service.selectLecWeekList(lolCode);
		
		return weekList;
	}
	
	/**
	 * 팝업 띄우기
	 * @param cnt
	 * @param lecCode
	 * @return
	 */
	@GetMapping(value = "/pAttendStrudentList/{cnt}/{lecCode}")
	public String popUpPAttent(@PathVariable int cnt,@PathVariable String lecCode) {
		
		log.debug("일단 값 확인 cnt : " + cnt);
		log.debug("일단 값 확인 lecCode : " + lecCode);
		
		return "popUpPAttend";
	}

	/**
	 * 민지
	 * 출결팝업에 띄워지는 학생리스트
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getLecAttendStudentList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getLecAttendStuList(@RequestBody AttendanceVO attendanceVO) throws Exception {
		
		
		List<Map<String, Object>> studentList = service.selectAttendStudentList(attendanceVO);
		
		return studentList;
	}
	
	/**
	 * 출석/지각/결석 머지문
	 * @param attendanceVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value =  "/insertAttentance")
	public String insertAttentance(@RequestBody AttendanceVO attendanceVO) throws Exception {
		log.debug("lecCode 잘 들어왔나?" + attendanceVO.getLec_code());
		
		int rslt = service.insertAttentance(attendanceVO);
		
		if(rslt > 0) {
			return "OK";
		}
		
		return "NG";
	}

	/**
	 * 공결신청화면창
	 * @return
	 */
	@GetMapping(value = "/attendApplyList")
	public String attendApplyApprovePage() {
		return "professor/attendApplyApprove";
	}
	
	/**
	 * 공결신청 리스트 뽑기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping("/getAttendApplyList")
	public List<Map<String, Object>> getAttendApplyList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> rsltList = service.selectAttendApplyList(userId);
		
		return rsltList;
		
	}
	
	/**
	 * 공결신청한 학생 정보 뽑기
	 * @param mapData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getAttendApplyStudent", produces = "application/json;charset=utf-8")
	public Map<String, Object> getAttendApplyStudent(@RequestBody Map<String, String> mapData) throws Exception {
		
		String aaCode = mapData.get("aaCode");
		
		Map<String, Object> attendDetail = service.selectAttendApplyDetail(aaCode);
		
		return attendDetail;
	}
	/**
	 * 공결 승인
	 * 출석부 상태값 출석으로 변경과 동시에 공결신청 상태값도 대기에서 승인으로 변경
	 * @param attendapplyVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/updateAttendApproval")
	public String updateAttendApproval(@RequestBody AttendApplyVO attendapplyVO) throws Exception {
		log.debug("attendapplyVO : " + attendapplyVO);
		String aaCode = attendapplyVO.getAa_code();
		String adCode = attendapplyVO.getAttend_code();
		log.debug("aaCode : " + aaCode);
		
		int cnt = service.updateAttendApply(aaCode);
		int cntAd = service.updateAttendanceState(adCode);
		
		if(cnt > 0 && cntAd > 0) {
			return "OK";
		}
	
		return "NG";

	}
	
	/**
	 * 반려신청은 공결신청 상태값만 변경
	 * @param attendapplyVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/updateAttentReject")
	public String updateAttentReject(@RequestBody AttendApplyVO attendapplyVO) throws Exception {
		log.debug("attendapplyVO : " + attendapplyVO);
		
		int cnt = service.updateAttentReject(attendapplyVO);
		
		if(cnt > 0) {
			return "OK";
		}
		return "NG";
	}
	
}
