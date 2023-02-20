package org.hdcd.controller.student.volunteer;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.volunteer.SVolunteerInService;
import org.hdcd.vo.VolunteerHisVO;
import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerQuizVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/volunteer")
public class SVolunteerInner {
	
	@Inject
	private SVolunteerInService service;


	/**
	 * [학생] 교내봉사 페이지 호출 메서드
	 * 
	 * @param req
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/showList",method = RequestMethod.GET)
	public ModelAndView VolInListForm(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = (String) req.getSession().getAttribute("userId");
		Integer inSumTime = service.selectMyInnerTime(id);
		Integer outSumTime = service.countMyTime(id);
		Integer totalTime = inSumTime + outSumTime;
		
		mav.addObject("totalTime",totalTime);
		mav.addObject("time",inSumTime);
		mav.setViewName("student/volunteerVideoList");
		
		return mav;
	}
	
	
	/**
	 * [학생] 교내봉사 영상 리스트 정보 호출 메서드
	 * @param req
	 * @return List
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/showListData",produces = "application/json;charset=UTF-8")
	public List<VolunteerListVO> volunteerVideoList(HttpServletRequest req) throws Exception {
		log.info("volunteerVideoList 실행~");
		
		String smem_no = (String) req.getSession().getAttribute("userId");
		
		List<VolunteerListVO> list = service.volunteerVideoList(smem_no);
		
		return list;
	}
	
	
	
	/**
	 * [학생] 퀴즈데이터 호출 메서드
	 * @param req
	 * @param voll_code
	 * @return List
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/showQuizList",produces = "application/json;charset=UTF-8")
	public List<VolunteerQuizVO> volunteerQuizList(HttpServletRequest req,String voll_code) throws Exception {
		log.info("volunteerQuizList 실행~");
		log.info("voll_code 확인 절차 : " + voll_code);
		System.out.println("체크 절차 : "+voll_code);
		List<VolunteerQuizVO> quizList =  service.selectQuizList(voll_code);
		
		return quizList;
	}
	
	
	
	/**
	 * [학생] 봉사시간 적립 메서드
	 * @param req
	 * @param voll_code
	 * @param volh_time
	 * @return String
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/insertVolTime" , produces = "text/plain;charset=UTF-8")
	public String volunteerInsertTime(HttpServletRequest req,String voll_code,String volh_time) throws Exception {
		log.info("volunteerInsertTime 확인합니다 !");
		log.info("voll_code 확인 : {}",voll_code);
		log.info("voll_time 확인 : {}",volh_time);
		String smem_no = (String) req.getSession().getAttribute("userId");
		
		int cnt = service.insertVolTime(smem_no,voll_code,volh_time);
		
		return "ok";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}














