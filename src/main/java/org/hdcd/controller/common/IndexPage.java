package org.hdcd.controller.common;

import java.util.List;
import java.text.ParseException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.hdcd.service.student.enroll.EnrollCheckService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexPage {
	
	@Inject
	MainPageService service;
	
	@Inject
	EnrollCheckService eservice;
	
	@RequestMapping(value = "/pageLogin", method = RequestMethod.GET)
	public String pageLogin() {
		log.debug("▶pageLogin");
		return "common/login";
	};
	
	
	@RequestMapping(value = "/page/list", method = RequestMethod.GET)
	public String list() {
		log.info("▶pageLogin");
		return "page/list";
	};
	
	
	@RequestMapping(value = "/main/home", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model, @RequestParam(required = false, value = "state") Object state) throws ParseException {
		String userId = (String) request.getSession().getAttribute("userId");

		System.out.println(state);
		HttpSession session = request.getSession();
		// 신규는 값이 있음 신규가 아니면 null임
//		if(session.getAttribute("state") != null) {
//			session.setAttribute("state", 0);
//		}else {
//			session.setAttribute("state",null);
//		}
		
		if(userId.equals("20170003")) { // 관리자일 경우			
			Map<String, String> info = service.getMainAdminInfo(userId);
			session.setAttribute("state", 1);
			model.addAttribute("admin", info);
		}else if(userId.length() == 8) { // 학생일 경우
			// 신규 체크
			if(!(eservice.checkMember(userId))) {
				session.setAttribute("state", 0);
			}else {
				session.setAttribute("state", 1);
			}
			Map<String, String> info = service.getMainStudentInfo(userId);
			model.addAttribute("student", info);
		}else if(userId.length() == 6) { // 교수일 경우
			Map<String, String> info = service.getMainProfessorInfo(userId);	
			session.setAttribute("state", 1);
			model.addAttribute("professor", info);
		}
		
		
		return "main/main";
	}
	
	@ResponseBody
	@GetMapping(value = "/main/chart", produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Map<String, Object>>> chartData(HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("userId");
		
		List<Map<String, Object>> dataList = service.getGraduateInfo(userId);
		
		return new ResponseEntity<List<Map<String, Object>>>(dataList, HttpStatus.OK);
	}
	
	
	
}

















