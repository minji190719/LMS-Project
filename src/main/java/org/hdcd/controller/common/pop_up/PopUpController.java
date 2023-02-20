package org.hdcd.controller.common.pop_up;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.pop_up.PopUpService;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.PopupSurveyVO;
import org.hdcd.vo.PopupVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common")
public class PopUpController {
	
	@Inject
	PopUpService popUpService; 
	
	@GetMapping("/popUp")
	public ModelAndView popUp(ModelAndView mav) {
		
		log.info("메인 페이지 팝업 메소드");
		
		List<PopupVO> popUpVOList = popUpService.popUpOn();
		
		log.info("팝업 광고 : {}", popUpVOList);
		
		for (PopupVO popupVO : popUpVOList) {
			log.info("팝업 광고 이미지 이름 : {}", popupVO.getPopup_image().substring(popupVO.getPopup_image().lastIndexOf("/") + 1));
			
			popupVO.setPopup_image(popupVO.getPopup_image().substring(popupVO.getPopup_image().lastIndexOf("/") + 1));
		}
		
		mav.addObject("popUpVOList", popUpVOList);
		mav.setViewName("popUp");
		
		return mav;
	}
	
	@GetMapping("/popSur")
	public ModelAndView popSur(ModelAndView mav) {
		
		log.info("메인 페이지 설문조사 팝업 메소드");
		
		mav.setViewName("popSur");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value = "/popupSurveyChange", produces = "application/json;charset=utf-8")
	public String popupSurveyChange(HttpServletRequest req, String popNum) {
		String userId = (String)req.getSession().getAttribute("userId");
		
		log.info("다시보지않기 메소드");
		
		log.info("다시보지않기 메소드 유저아이디 : {}", userId);
		
		log.info("다시보지않기 메소드 팝업넘버 : {}", popNum);
		
		int res = popUpService.popupSurveyChange(userId, popNum);
		
		log.info("다시보지않기 res : {}", res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
	@ResponseBody
	@PostMapping(value = "/popupSurveyState", produces = "application/json;charset=utf-8")
	public MemberVO popupSurveyState(HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("userId");
		
		log.info("popupSurveyActive 메소드");
		
		log.info("popupSurveyActive : {}", userId);
		
		MemberVO memberVO = popUpService.popupSurveyState(userId);
		
		log.info("popupSurveyActive memberVO : {}", memberVO);
		
		return memberVO;
	} 
	
	@ResponseBody
	@PostMapping(value = "/popupSurveySubmit", produces = "application/json;charset=utf-8")
	public String popupSurveySubmit(HttpServletRequest req, PopupSurveyVO popupSurveyVO) {
		String userId = (String)req.getSession().getAttribute("userId");
		
		log.info("팝업 설문조사 제출  userId : {}", userId);
		log.info("팝업 설문조사 제출 : {}", popupSurveyVO);
		
		int res = popUpService.popupSurveySubmit(userId, popupSurveyVO);
		
		log.info("팝업 설문조사 제출 res : {}", res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
}
