package org.hdcd.controller.student.lecture;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.lecture.StudentLectureService;
import org.hdcd.vo.LecGradeVO;
import org.hdcd.vo.LecSurveyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/evaluation")
public class LectureEvaluationController {
	
	
	@Inject
	StudentLectureService service;
	
	@GetMapping(value = "/home")
	public String evaluationMain() {
		
		return "student/lecture/evaluationLecture";
	}
	
	@ResponseBody
	@GetMapping("/myEvalList")
	public ResponseEntity<List<Map<String,Object>>> showEvalList(HttpServletRequest request){
		ResponseEntity<List<Map<String,Object>>> entity = null;
		HttpSession session = request.getSession();
		String smemNo = (String)session.getAttribute("userId");
		
		// 학번 년도 학기 필요함
		LecGradeVO lecGrade = new LecGradeVO();
		lecGrade.setLg_semester(2);     // 학년
		lecGrade.setLg_year(2022);      // 현재학기
		lecGrade.setSmem_no(smemNo);
		
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		dataList = service.getMyEvalList(lecGrade);
		
		if(dataList.size() > 0) {
			entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/insertEval")
	public ResponseEntity<String> insertEvaluation(@RequestBody LecSurveyVO lecSurvey, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		lecSurvey.setLs_note("");
		lecSurvey.setSmem_no(userId);
		
		int cnt = service.insertLecSurvey(lecSurvey);
		if(cnt > 0) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
}
