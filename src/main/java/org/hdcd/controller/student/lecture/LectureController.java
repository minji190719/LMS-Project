package org.hdcd.controller.student.lecture;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.lecture.StudentLectureService;
import org.hdcd.vo.LecApplyVO;
import org.hdcd.vo.StuTimetableVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@Inject
	StudentLectureService service;
	
	
	@GetMapping("/home")
	public String mainLecture() {
		return "member/student/lectureHome";
	}

	// 강의 인서트
	@ResponseBody
	@PostMapping(value = "/insertLec/{urlCode}")
	public ResponseEntity<Map<String, Object>> insertLec(@PathVariable String urlCode, @RequestBody Map<String,Object> code
					, HttpServletRequest request) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		// 수강바구니에 있는 상태면 상태 == 0
		// 일반적인 상황에서는 상태 == 1

		// laCode 는 수강바구니의 기본키임 이게 있다는 소리는 예비수강신청을 했었다는 소리임
		Map<String,Object> dataMap = new HashMap<String, Object>();
		LecApplyVO tmpLecApply = new LecApplyVO();
		tmpLecApply.setSmem_no(userId);
		
		if(urlCode.equals("laCode")) {
			// 수강바구니에 있는 상태임
			
			tmpLecApply.setLa_state(1);
			tmpLecApply.setLa_code((String)code.get("laCode"));
			
			// la_state = 1, smem_no = 내학번
			dataMap = service.insertHis(tmpLecApply);
			dataMap.remove("MEM_PHOTONM");
			
			
			if(dataMap != null) {
				entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
				return entity;
			}
		}
		
		if(urlCode.equals("lecCode")) {
			
			tmpLecApply.setLec_code((String)code.get("lecCode"));
			
			boolean flag = checkLec(tmpLecApply);
			  
			if(flag) {
				entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.BAD_REQUEST);
				return entity;
			}

			dataMap = service.insertHis(tmpLecApply);
			dataMap.remove("MEM_PHOTONM");
			
			if(dataMap != null) {
				entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
				return entity;
			}
		}

		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.BAD_REQUEST);
		
		return entity;
		
	}
	

    private boolean checkLec(LecApplyVO lecApply) {
	   
	    // 없으면 등록 가능
        LecApplyVO myLecApply = service.selectLecApplyOne(lecApply);
	    if(myLecApply == null) {
	 	    return false;
	    }
	    return true;
    }

	
    @ResponseBody
    @PostMapping(value = "/insertTimeTable")
	public ResponseEntity<String> insertTimeTable(@RequestBody Map<String, Object> dataMap,
			HttpServletRequest request) {
    	ResponseEntity<String> entity = null;
    	
    	HttpSession session = request.getSession();
    	String userId = (String)session.getAttribute("userId");
    	// 첫번쨰 lecOpenList 두번째 lecture
    	
    	StuTimetableVO stuTimeTable = new StuTimetableVO();
    	stuTimeTable.setSt_day1((String)dataMap.get("LOL_DAY1"));
    	stuTimeTable.setSt_day2((String)dataMap.get("LOL_DAY2"));
    	stuTimeTable.setSt_starttime1((String)dataMap.get("LOL_STARTIME1"));
    	stuTimeTable.setSt_starttime2((String)dataMap.get("LOL_STARTIME2"));
    	stuTimeTable.setSt_endtime1((String)dataMap.get("LOL_ENDTIME1"));
    	stuTimeTable.setSt_endtime2((String)dataMap.get("LOL_ENDTIME2"));
    	stuTimeTable.setSt_year((int)dataMap.get("LOL_YEAR"));
    	stuTimeTable.setSt_semester((int)dataMap.get("LOL_SEMESTER"));
    	stuTimeTable.setSmem_no(userId);
    	stuTimeTable.setLec_code((String)dataMap.get("LEC_CODE"));
    	
    	int cnt = service.insertTimeTable(stuTimeTable);
    	
    	if(cnt > 0) {
    		entity = new ResponseEntity<String>("success", HttpStatus.OK);
    	}else {
    		entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
    	}
    	
    	return entity;
	}
	
	
	
	
	
	
	

}
