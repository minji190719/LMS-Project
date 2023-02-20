package org.hdcd.controller.manager.enrollFee_manage;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.service.manager.enrollFee.IEnrollFeeManageService;
import org.hdcd.vo.EnrollFeeVO;
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
@RequestMapping("/tuition/manage")
public class EnrollFeeManageController {
	
	@Inject
	IEnrollFeeManageService service;
	
	/**
	 * [관리자] 등록금 관리 페이지를 요청하는 메소드
	 * 
	 * @return enrollFeeManage.jsp
	 */
	@GetMapping
	public String getTuiHome(Model model) {
		log.debug("▶[관리자] 등록금 관리 페이지 요청하는 getTuiHome 실행");
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int semester = (month < 7) ? 1 : 2;
		
		EnrollFeeVO enrollFeeVO = new EnrollFeeVO();
		enrollFeeVO.setEnrl_year(year);
		enrollFeeVO.setEnrl_semester(semester);
		
		Map<String, String> sMap = new HashMap<String, String>();
		sMap.put("enrl_year", Integer.toString(year));
		sMap.put("enrl_semester", Integer.toString(semester));
		
		int paidCnt = service.checkPaidPeople(enrollFeeVO);
		int totalCnt = service.checkTuiOpen(sMap);
		model.addAttribute("paidCnt", paidCnt);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		
		return "manager/enrollFeeManage";
	}
	
	/**
	 * [관리자] 등록금 납부 기능을 학생 주체에게 오픈할 수 있는지의 여부를 판단하는 메소드
	 * 
	 * @param enrl_year 현재 년도
	 * @param enrl_semester 현재 학기(1은 1학기, 2는 2학기)
	 * @return 0(오픈 가능), 1(오픈 불가-이미 오픈 상태)
	 */
	@ResponseBody
	@GetMapping(value = "/check/{enrl_year}/{enrl_semester}", produces = "text/plain;charset=UTF-8")
	public String checkTuiOpen(@PathVariable String enrl_year, @PathVariable String enrl_semester) {
		log.debug("▶[관리자] 1학기/2학기 등록금 납부 오픈 가능 여부를 판단하는 checkTuiOpen 실행");
		Map<String, String> sMap = new HashMap<String, String>();
		sMap.put("enrl_year", enrl_year);
		sMap.put("enrl_semester", enrl_semester);
		int cnt = service.checkTuiOpen(sMap);

		return Integer.toString(cnt);
	}
	
	/**
	 * [관리자] 최초 오픈시 모든 재학생들에게 등록금을 고지하는 메소드
	 * 
	 * @param enrl_year 등록금 납부 개시 년도
	 * @param enrl_semester 등록급 납부 개시 학기
	 * @return 0(고지 실패), 0이상(고지 성공한 학생의 숫자)
	 */
	@ResponseBody
	@GetMapping(value ="/notifyTuiEnrolled/{enrl_year}/{enrl_semester}", produces = "text/plain;charset=UTF-8")
	public String notifyTuiEnrolled(@PathVariable String enrl_year, @PathVariable String enrl_semester) {
		log.debug("▶[관리자] 최초 오픈시 모든 재학생들에게 등록금을 고지하는 메소드 notifyTuiEnrolled() 실행");
		Map<String, String> nMap = new HashMap<String, String>();
		nMap.put("enrl_year", enrl_year);
		nMap.put("enrl_semester", enrl_semester);
		log.debug("enrl_year와 enrl_semester {}", nMap.toString());
		int totalCnt = service.notifyTuiEnrolled(nMap);
		return Integer.toString(totalCnt);
	}

	/**
	 * [관리자] 등록금 미고지 학생명단을 조회하는 메소드
	 * 
	 * @param enrl_year 등록금 납부 년도
	 * @param enrl_semester 등록급 납부 학기
	 * @return
	 */
	@ResponseBody
	@GetMapping(value ="/getUnannouncedTui/{enrl_year}/{enrl_semester}", produces ="application/json;charset=UTF-8")
	public List<EnrollFeeVO> getUnannouncedTui(@PathVariable String enrl_year, @PathVariable String enrl_semester) {
		log.debug("[관리자] 등록금 미고지 학생명단을 조회하는 메소드 getUnannouncedTui() 실행");		
		List<EnrollFeeVO> unannouncedTuiList = service.getUnannouncedTui(enrl_year, enrl_semester);
		return unannouncedTuiList;
	}
	
	
	@ResponseBody
	@PostMapping(value ="/informTheRestStu", produces ="text/plain;charset=UTF-8")
	public String informTheRestStu(@RequestBody EnrollFeeVO enrollFeeVO) {
		log.debug("[관리자] 등록금 미고지 학생에게 등록금을 고지하는 informTheRestStu() 실행");	
		log.debug("enrollFeeVO.toString : " + enrollFeeVO.toString());
		int cnt = service.registerEnrollfee(enrollFeeVO);
		return Integer.toString(cnt);
	}
	

	/**
	 * [관리자] 등록금 고지 학생명단을 조회하는 메소드
	 * 
	 * @param enrl_year 등록금 납부 년도
	 * @param enrl_semester 등록급 납부 학기
	 * @return
	 */
	@ResponseBody
	@GetMapping(value ="/getAnnouncedTui/{enrl_year}/{enrl_semester}", produces = "application/json;charset=UTF-8")
	public List<EnrollFeeVO> getAnnouncedTui(@PathVariable String enrl_year, @PathVariable String enrl_semester) {
		log.debug("[관리자] 등록금 고지 학생명단을 조회하는 메소드 getAnnouncedTui() 실행");	
		Map<String, String> nMap = new HashMap<String, String>();
		nMap.put("enrl_year", enrl_year);
		nMap.put("enrl_semester", enrl_semester);
		List<EnrollFeeVO> resultMap = service.getAnnouncedTui(nMap);
		log.debug("컨트롤러에서 받은 고지 명단 "+  resultMap.toString());
		
		return resultMap;
	}
}
