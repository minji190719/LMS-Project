package org.hdcd.controller.student.enrollFee;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.enrollFee.IEnrollFeeService;
import org.hdcd.vo.EnrollFeeVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tuition")
public class EnrollFeeController {
	
	@Inject
	IEnrollFeeService service;
	
	/**
	 * [학생] 등록금 조회 페이지를 요청하는 메소드
	 * 
	 * @param request
	 * @param model
	 * @return enrollFee.jsp
	 */
	@GetMapping
	public String enrollFeeHome(HttpServletRequest request, Model model) {
		log.debug("[학생] 등록금 조회 enrollFeeHome");
		String smem_no = (String) request.getSession().getAttribute("userId");
		List<EnrollFeeVO> enrollFeeList = service.getEnrollFeeList(smem_no);
		Map<String, Object> studentInfo = service.getStudentInfo(smem_no);
		log.debug("학생의 등록금 목록: " + enrollFeeList.toString());
		log.debug("학생의 개인 정보: " + studentInfo.toString());
		for (int i = 0; i < enrollFeeList.size(); i++) {
			EnrollFeeVO enrollVO = enrollFeeList.get(i);
			String enrl_date = enrollVO.getEnrl_date();
			if(enrl_date != null) {
				enrollFeeList.get(i).setEnrl_date(enrl_date.replace(".0", ""));
			}
		}
		model.addAttribute("enrollFeeList", enrollFeeList);
		model.addAttribute("studentInfo", studentInfo);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int semester = (month < 7) ? 1 : 2;
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		
		return "student/enrollFee";
	}
	
	@ResponseBody
	@GetMapping(value = "/pay/{enrl_code}", produces = "text/plain;charset=UTF-8")
	public String payEnrollFee(@PathVariable String enrl_code) {
		log.debug("[학생] 등록금 납부 payEnrollFee");
		log.debug("enrl_code : " + enrl_code);
		int cnt = service.payEnrollFee(enrl_code);
		return Integer.toString(cnt);
	}	
}
