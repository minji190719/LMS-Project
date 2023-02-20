package org.hdcd.controller.student.record;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hdcd.service.student.record.IRecordApplyService;
import org.hdcd.vo.RecordApplyVO;
import org.hdcd.vo.VolunteerOutVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/recordapply")
public class RecordApplyController {

	@Autowired
	private IRecordApplyService recordapplyservice;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String recordapplymain() {
		log.debug("recordapplymain");
		return "student/sRecordApply";
	}
	
	//리스트
	@RequestMapping(value = "/applylist", method = RequestMethod.GET)
	public ModelAndView recordapplylist(ModelAndView mav, HttpServletRequest req) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		List<RecordApplyVO> recordapplynolist = recordapplyservice.selectrecordapplyByNo(smem_no);
		Map<String, Object> myinfoList = recordapplyservice.selectinfoByNo(smem_no);
		mav.addObject("Myinfo", myinfoList);
		mav.addObject("recordapplynolist", recordapplynolist);
		mav.setViewName("student/sRecordApply");
		return mav;

	}
	@RequestMapping(value = "/recordapplyForm", method = RequestMethod.GET)
	public String recordapplyForm(HttpServletRequest req) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		return "student/applylist";
	}
	// 학적변동신청
	@RequestMapping(value = "/SrecordApply", method = RequestMethod.POST)
	public String recordapply(HttpServletRequest req, RecordApplyVO recvo) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		recvo.setSmem_no(smem_no);
		recordapplyservice.add_to_record(recvo);
		return "redirect:/recordapply/applylist";
	}
	
	// 학적변동 삭제, 상태가 0일때
	@ResponseBody
	@PostMapping(value = "/ApplyDelete", produces = "text/plain;charset=utf-8")
	public String deleteapply(HttpServletRequest req, String rcrda_code) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		recordapplyservice.delete_to_record(rcrda_code);
		log.info(rcrda_code);
		return "SUCCESS";
	}
}
