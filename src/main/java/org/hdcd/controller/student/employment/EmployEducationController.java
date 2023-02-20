package org.hdcd.controller.student.employment;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.employment.EmployEducationService;
import org.hdcd.vo.EmployApplyVO;
import org.hdcd.vo.EmployProgramVO;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employEducation")
public class EmployEducationController {
	
	@Inject
	EmployEducationService employEducationService;
	
	/**
	 * [취업 프로그램 페이지 요청]
	 * @return student/employEducationPage.jsp
	 */
	@GetMapping("/employEducationPage")
	public String EmployEducationPage() {
		return "student/employEducationPage";
	}
	
	

	/**
	 * [취업 프로그램 리스트 데이터 요청]
	 * @param searchWord
	 * @return List<EmployProgramVO>
	 */
	@ResponseBody
	@PostMapping(value = "/employEducationProgramList", produces = "application/json;charset=utf-8")
	public List<EmployProgramVO> employEducationProgramList(@RequestParam(value = "searchWord", required = false)String searchWord) {
		
		log.info("검색단어 : {}", searchWord);
		
		List<EmployProgramVO> employEducationProgramList = employEducationService.getEmployEducationProgram(searchWord);
		
		for (EmployProgramVO employProgramVO : employEducationProgramList) {
			employProgramVO.setEpro_start(employProgramVO.getEpro_start().substring(0,employProgramVO.getEpro_start().lastIndexOf(":")));
			employProgramVO.setEpro_end(employProgramVO.getEpro_end().substring(0, employProgramVO.getEpro_end().lastIndexOf(":"))); 
		}
		
		return employEducationProgramList;
		
	}
	

	/**
	 * [취업 프로그램 디테일 정보]
	 * @param epro_code
	 * @return EmployProgramVO
	 */
	@ResponseBody
	@PostMapping(value = "/employEducationProgramDetailPage", produces = "application/json;charset=utf-8")
	public EmployProgramVO employEducationProgramDetailPage(String epro_code) {
		
		log.info("취업 프로그램 디테일 페이지 epro_code : {}", epro_code);
		
		EmployProgramVO employProgramVO = employEducationService.employEducationProgramDetailPage(epro_code);
		
		employProgramVO.setEpro_start(employProgramVO.getEpro_start().substring(0,employProgramVO.getEpro_start().lastIndexOf(":")));
		employProgramVO.setEpro_end(employProgramVO.getEpro_end().substring(0, employProgramVO.getEpro_end().lastIndexOf(":"))); 
		employProgramVO.setEpro_content(employProgramVO.getEpro_content().substring(employProgramVO.getEpro_content().lastIndexOf("/") + 1)); 
		
		return employProgramVO;
		
	}
	

	/**
	 * [취업 프로그램 신청 처리 메소드]
	 * @param epro_code
	 * @param req
	 * @return 신청 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/employEducationProgramApply", produces = "application/json;charset=utf-8")
	public String employEducationProgramApply(String epro_code, HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("userId");
		
		log.info("취업 프로그램 신청 처리 epro_code : {}", epro_code);
		
		EmployApplyVO employApplyVO = employEducationService.employEducationProgramApplyValidation(epro_code, userId);
		
		if(employApplyVO == null) {
			employEducationService.employEducationProgramApply(epro_code, userId);
			return "OK";
		}
		
		return "NG";
		
	}
	
	
	
}
