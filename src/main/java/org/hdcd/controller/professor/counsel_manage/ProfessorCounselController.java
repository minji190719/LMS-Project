package org.hdcd.controller.professor.counsel_manage;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.professor.ProfessorCounselService;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor")
public class ProfessorCounselController {
	
	@Inject
	ProfessorCounselService professorCounselService;
	
	/**
	 * [상담신청 내역]
	 * @param mav
	 * @param req
	 * @return professor/counselList.jsp
	 */
	@GetMapping("/counselList")
	public ModelAndView professorCounsel(ModelAndView mav, HttpServletRequest req) {
		
		String professorSessionId = (String)req.getSession().getAttribute("userId");
		log.info("교수 세션번호 : " + professorSessionId);
		
		List<CounselApplyVO> professorCounselList = professorCounselService.professorApplyCounsel(professorSessionId);
		
		log.info("교수 상담신청리스트 : {}", professorCounselList);
		
		// 상담신청한 학생 이름을 가져오는 메소드 
		List<MemberVO> studentNameList = new ArrayList<MemberVO>();
		
		for (CounselApplyVO counselApplyVO : professorCounselList) {
			studentNameList.add(professorCounselService.getStudentName(counselApplyVO.getSmem_no()));
		}
		
		log.info("학생이름 : {}", studentNameList);
		
		// 날짜 포멧(은혁이가 시킨)
		for (CounselApplyVO counselApplyVO : professorCounselList) {
			counselApplyVO.setCnsla_date(counselApplyVO.getCnsla_date().substring(0, counselApplyVO.getCnsla_date().indexOf(" ")));
			counselApplyVO.setCnsl_date(counselApplyVO.getCnsl_date().substring(0, counselApplyVO.getCnsl_date().indexOf(" ")));
		}
		
		mav.addObject("professorCounselList", professorCounselList);
		mav.addObject("studentNameList", studentNameList);
		mav.setViewName("professor/counselList");
		
		return mav;
	}
	
	/**
	 * [상담신청 반려]
	 * @param counselApplyVO
	 * @return 반려 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/counsel/return", produces = "application/text;charset=utf-8")
	public String counselReturn(CounselApplyVO counselApplyVO) {
		log.info("counselReturn 의 CounselApplyVO 값 {}", counselApplyVO);
		
		int res = professorCounselService.counselReturn(counselApplyVO);
		
		log.info("counselReturn 반려 신청 후 값 변경 row수" + res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	
	/**
	 * [상담신청 승인 메소드]
	 * @param counselApplyVO
	 * @return 승인 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/counsel/validation", produces = "application/text;charset=utf-8")
	public String counselValidation(CounselApplyVO counselApplyVO) {
		log.info("counselValidation 의 CounselApplyVO 값 {}", counselApplyVO);
		
		int res = professorCounselService.counselValidation(counselApplyVO);
		
		log.info("counselReturn 반려 신청 후 값 변경 row수" + res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	
}
