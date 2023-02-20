package org.hdcd.controller.student.mypage;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hdcd.service.student.mypage.MypageService;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.MyPageVO;
import org.hdcd.vo.NoticeVO;
import org.hdcd.vo.RecordApplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mypagemain() {
		return "student/studentMypage";
	}
	
	@GetMapping(value = "/List")
	public ModelAndView mypageList(HttpServletRequest req,MyPageVO vo, ModelAndView mav)throws Exception{
		String smem_no = (String) req.getSession().getAttribute("userId");
		List<MyPageVO> getList = service.MypageList(smem_no);
		List<RecordApplyVO> getappList = service.recordhis(smem_no);
		mav.addObject("getList",getList);
		mav.addObject("getappList", getappList);
		mav.setViewName("student/studentMypage");
		return mav;
	}
	@PostMapping(value = "/uppic", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updatepic(HttpServletRequest req, @Valid MemberVO memberVo, BindingResult result) throws Exception {
		String mem_no = (String) req.getSession().getAttribute("userId");
		int res = service.updatepic(memberVo, req);
		if(result.hasErrors()) {
			return "updatepic";
		}
		if(res > 0) {
			HttpSession session = req.getSession();
			session.setAttribute("state",1);
		}
		return "등록이 완료되었습니다.";
	}
	
	@PostMapping(value = "updateimg", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateimg(HttpServletRequest req,List<MultipartFile> member_imagee) throws Exception {
		String mem_no = (String) req.getSession().getAttribute("userId");
		int res = service.updateimg(member_imagee, req);
		return "등록이 완료되었습니다.";
	}
}
