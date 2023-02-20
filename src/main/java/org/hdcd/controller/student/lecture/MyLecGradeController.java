package org.hdcd.controller.student.lecture;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.lecture.StudentLectureService;
import org.hdcd.vo.LecGradeVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/student")
public class MyLecGradeController {
	
	@Inject
	StudentLectureService service;
	
	@GetMapping(value = "/myLecGrade")
	public String myLecGrade() {
		return "student/lecture/myGrade";
	}
	
	@GetMapping(value = "/myLecGradeNow")
	public String myLecGradeNow(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		// 현재 학기에 해당하는 성적테이블의 state 가 0이 있는것이 있으면 안댐
		LecGradeVO lecGrade = new LecGradeVO();
		lecGrade.setSmem_no(userId);
		lecGrade.setLg_year(2022);
		lecGrade.setLg_semester(2);
		
		Map<String, Object> dataMap = service.checkEvalState(lecGrade);
		int total_cnt = Integer.parseInt(String.valueOf(dataMap.get("TOTAL_CNT")));
		int true_cnt = Integer.parseInt(String.valueOf(dataMap.get("TRUE_CNT")));
		
		if(total_cnt != true_cnt) {
			return "student/lecture/errorPageEval";
		}else {
			List<LecGradeVO> dataList = service.getMyGradeList(lecGrade);
			model.addAttribute("dataList", dataList);
			return "student/lecture/myGradeNow";
		}
	}
	
	@ResponseBody
	@PostMapping(value = "/myGradeList", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<LecGradeVO>> getMygradeList(HttpServletRequest request, 
			               @RequestBody LecGradeVO lecGrade){
		
		ResponseEntity<List<LecGradeVO>> entity=null;
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		lecGrade.setSmem_no(userId);
		List<LecGradeVO> dataList  = new ArrayList<LecGradeVO>();
		
		dataList = service.getMyGradeList(lecGrade);
		
		if(dataList != null && dataList.size() > 0) {
			entity = new ResponseEntity<List<LecGradeVO>>(dataList, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<LecGradeVO>>(dataList, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@PostMapping(value = "/nowMyGradeList")
	public ResponseEntity<List<Map<String, Object>>> nowMyGradeList(HttpServletRequest request){
		String userId = (String) request.getSession().getAttribute("userId");
		
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("SMEM_NO", userId);
		dataMap.put("LG_YEAR", 2022);
		dataMap.put("LG_SEMESTER", 2);
 		dataList = service.getNowMyGrade(dataMap);
		
		return dataList.size() > 0 ? new ResponseEntity<List<Map<String,Object>>>(dataList,HttpStatus.OK):
									 new ResponseEntity<List<Map<String,Object>>>(dataList,HttpStatus.BAD_REQUEST);
	}
	

	
	
	
	
	
	
	
	
	
	

}
