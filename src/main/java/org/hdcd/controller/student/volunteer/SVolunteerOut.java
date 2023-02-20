package org.hdcd.controller.student.volunteer;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.volunteer.SVolunteerService;
import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerOutVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/volunteer")
public class SVolunteerOut {
	
	@Inject
	private SVolunteerService service;

	
	/**
	 * [학생] 교외봉사내역 리스트 불러오는 메소드
	 * @param req
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/outList",method = RequestMethod.GET)
	public ModelAndView volunteerSelectList(HttpServletRequest req) throws Exception {
		log.info("volunteerSelectList 실행~");
		
		String id = (String) req.getSession().getAttribute("userId");
		
		ModelAndView mav = new ModelAndView();
		
		List<VolunteerOutVO> list = service.volunteerOutSelectList(id);
		
		Integer outSumTime = service.countMyTime(id);
		
		Integer inSumtime = service.selectMyInnerTime(id);
		
		Integer totalTime = outSumTime + inSumtime;
		
		mav.addObject("totalTime",totalTime);
		mav.addObject("time",outSumTime);
		mav.addObject("list",list);
		mav.addObject("id",id);
		mav.setViewName("student/volunteerOutList");
		return mav;
	}
	
	
	/**
	 * [학생] 교외봉사 등록신청 insert 후 리스트 불러오는 메소드
	 * @param req
	 * @param vo
	 * @param volo_rfiles
	 * @return String
	 * @throws Exception
	 */
	@PostMapping(value = "/outRegister",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String volunteerRegister(HttpServletRequest req,VolunteerOutVO vo,List<MultipartFile> volo_rfiles) throws Exception {
		log.info("outRegister 실행~");
//		log.info("파일 사이즈 : "+volo_rfiles.size());
//		log.info("파일명 : "+volo_rfiles.get(0).getOriginalFilename());
		
		int insert = service.registerOutVol(vo,volo_rfiles,req);
		
		return "신청이 완료되었습니다!";
	}
	
	/**
	 * [학생] 교외봉사 등록신청한 것 취소하는 메소드
	 * @param req
	 * @param volo_code
	 * @return String
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/outDelete",produces = "text/plain;charset=UTF-8")
	public String volunteeroutDelete(HttpServletRequest req, String volo_code) throws Exception {
		log.info("volunteeroutDelete 실행~");
		
		String id = (String) req.getSession().getAttribute("userId");
		
		service.deleteOutRegister(volo_code);
		
		return "신청이 취소되었습니다!";
	}
	


	/**
	 * [학생] 봉사 교육영상 가져오는 메서드
	 * @param req
	 * @param voll_code
	 * @return VolunteerListVO
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/showVideo",produces = "application/json;charset=UTF-8")
	public VolunteerListVO volunteerSelectOneVideo(HttpServletRequest req,String voll_code) throws Exception {
		log.info("volunteerSelectOneVideo 실행~");
		
		VolunteerListVO vo = service.selectOneVideo(voll_code);
		
//		log.info("vo결과를 보자~" + vo.getVoll_name());
		return vo;
	}
	
	
	@GetMapping("/quizPage")
	public String volunteerQuizForm() {
		
		return "student/quizPage";
	}
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
