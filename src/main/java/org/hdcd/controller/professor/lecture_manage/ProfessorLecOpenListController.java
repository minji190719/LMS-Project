package org.hdcd.controller.professor.lecture_manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.professor.ILecOpenListService;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecturePlanVO;
import org.hdcd.vo.MemberVO;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lol")
public class ProfessorLecOpenListController {
	
	
	@Inject
	private ILecOpenListService lolservice;
	
	/**
	 * 민지
	 * 교수 교과목 등록 페이지
	 * @param request
	 * @return
	 */
	@GetMapping(value = "/lecOpenList")
	public String lecOpenList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		return "professor/lecOpenList";
	}
	
	/**
	 *  팝업창 열기. 교과목등록신청 버튼 클릭시 & 수정 버튼 클릭시
	 * @param state
	 * @param lolCode
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/lectureOpenRegister/{state}/{lolCode}")
	public String professorInsertTest2(@PathVariable String state,@PathVariable String lolCode, Model model)  throws Exception {
		log.debug("state {}",state);
		log.debug("lolCode {}", lolCode);
		
		if(state.equals("update")) {
			LecOpenListVO lecOpenListVO = lolservice.selectOneLol(lolCode);
			LecturePlanVO lecturePlanVO = lolservice.selectOneLp(lolCode);
			
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("lecOpenListVO", lecOpenListVO);
			dataMap.put("lecturePlanVO", lecturePlanVO);
//			lecOpenListVO.setLpVO(lecturePlanVO);
			
//			log.debug("lecOpenListVO : " +lecOpenListVO.getLpVO().getLp_attend_ref());
			log.debug("lecturePlanVO : " +lecturePlanVO);
				
			model.addAttribute("formName", "update");
//			model.addAttribute("lolVO", lecOpenListVO);
			model.addAttribute("dataMap", dataMap);
		}
		
		if(state.equals("insert")) {
			model.addAttribute("formName","insert");
		}
		
		return "lectureOpenRegister";
	}
	
	/**
	 * 민지 
	 * 교과목 등록 신청 완료 목록 뽑기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/lecOpenSelectList", produces = "application/json;charset=utf-8")
	public List<LecOpenListVO> lecOpenSelectList(HttpServletRequest request) throws Exception {
		log.debug("컨트롤러로 오긴 하나요?");
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		log.debug("userId  :   " + userId);
		
		List<LecOpenListVO> lecOpenListVO = lolservice.selectList(userId);
		
		return lecOpenListVO;
	}

	/**
	 * 민지
	 * 교과목 등록 신청 인서트
	 * @param lecOpenListVO
	 * @param lecturePlanVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertLectureOpen", method = RequestMethod.POST)
	public String insertLectureOpen(LecOpenListVO lecOpenListVO, LecturePlanVO lecturePlanVO, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		lecOpenListVO.setPmem_no(userId);
		log.debug("lecOpenListVO:" + lecOpenListVO);
		int rslt = lolservice.insertLecList(lecOpenListVO);
		log.debug("lolCode:" + lecOpenListVO.getLol_code());
		lecturePlanVO.setLol_code(lecOpenListVO.getLol_code());
		log.debug("lecturePlanVO" + lecturePlanVO);
		lolservice.insertLecPlan(lecturePlanVO);
		return "ok";
	}
	
	/**
	 * 민지
	 * 교과목 등록 신청 후 신청서 삭제
	 * @param mapData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/deleteLectureOpen", produces = "application/json;charset=utf-8")
	public String deleteLectureOpen(@RequestBody Map<String, String> mapData, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		log.debug("너머온 값 확인: " + mapData.get("lol_code"));
		int rslt  = lolservice.deleteLecList(mapData.get("lol_code"));
		if(rslt > 0) {
			return "OK";			
		}
		return "NG";

	}
	
	/**
	 * 민지
	 * 교과목 등록 신청 후 신청서 수정
	 * @param lecOpenListVO
	 * @param lecturePlanVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/updateLectureOpen")
	public String updateLectureOpen(LecOpenListVO lecOpenListVO, LecturePlanVO lecturePlanVO) throws Exception {
		int cntLol = lolservice.updateLecOpenList(lecOpenListVO);
		lecturePlanVO.setLol_code(lecOpenListVO.getLol_code());
		int cntLp = lolservice.updateLecPlan(lecturePlanVO);
		
		if(cntLol > 0 && cntLp > 0) {
			return "OK";			
		}
		
		return "NG";			
	}
	
// ========================================== 여기까지가 lecOpenList.jsp 교과목 등록 신청

	/**
	 * 	민지
	 *  교과목 등록 신청 후 강의 개설 페이지 
	 * @param request
	 * @return
	 */
	@GetMapping("/openSuccessLecList")
	public String openSuccessLecList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		return "professor/openSuccessLecList";
	}
	
	
	/**
	 * 민지
	 * 교과목 승인 완료 목록 뽑기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/selectMySuccessLecuture", produces = "application/json;charset=utf-8;")
	public List<Map<String, Object>> selectMySuccessLecuture(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<Map<String, Object>> lecList = lolservice.selectLecList(userId);
		
		log.debug("lecList.dep_name : " +lecList.get(1).get("DEP_NAME"));
		
		
		return lecList;
	}
	
	/**
	 * 민지
	 * 교과목 승인완료 된 것들 중 강의 개설하기.
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/professorlecUpdate")
	public String lecUpdate(@RequestBody Map<String, String> map) throws Exception {
		
		int cnt = lolservice.updatePLecture(map.get("lec_code"));
		if(cnt > 0) {
			return "OK";			
		}
		return "NG";	
	}

	@ResponseBody
	@PostMapping(value = "/professorlecUpdateZero")
	public String lecUpdateZero(@RequestBody Map<String, String> map) throws Exception {
		
		int cnt = lolservice.updatePLectureZero(map.get("lec_code"));
		if(cnt > 0) {
			return "OK";			
		}
		return "NG";	
	}
	
	/**
	 * 민지
	 * 강의계획서 페이지 이동
	 * @return
	 */
	@GetMapping(value = "/lecturePlanList")
	public String lecturePlanList() {
		
		return "professor/lecturePlanList";
	}
	
	/**
	 * 민지
	 * 강의계획서 리스트 가져오기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/getLecturePlanList")
	public List<Map<String, Object>> getLecturePlanList(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> map = lolservice.selectLecturePlanList(userId);
		
		return map;
	}
	
	/**
	 * 민지
	 * 강의계획서 디테일 가져오기
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getLecturePlan", produces = "application/json;charset=utf-8;")
	public List<LecturePlanVO> getLecturePlan(@RequestBody Map<String, String> map) throws Exception {
		
		String lolCode = map.get("lolCode");
		log.debug("lolCode : " + lolCode);
		
		List<LecturePlanVO> lpVO = lolservice.selectOneLecPlan(lolCode);
		  
		
		return lpVO;
	}
	
	/**
	 * 민지
	 * 강의계획서 페이지에서 강의 계획서 디테일 수정
	 * @param lecturePlanVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/updateLecturePlan")
	public String updateLecturePlan(LecturePlanVO lecturePlanVO) throws Exception {
		
		log.debug("수정lecturePlanVO : " + lecturePlanVO);
		
		int cnt = lolservice.updateLecPlan(lecturePlanVO);
		
		if(cnt > 0) {
			return "OK";
		}
		return "NG";
	}
	
	@ResponseBody
	@GetMapping(value = "/getProfessorMyInfo", produces = "application/json;charset=utf-8")
	public Map<String, Object> getProfessorMyInfo(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		Map<String, Object> mapData = lolservice.selectProfessorMyInfo(userId);
		
		return mapData;
	}
}
