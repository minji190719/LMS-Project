package org.hdcd.controller.student.schedule;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.schedule.ScheduleService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule")  
public class ScheduleController {
	
	@Inject
	ScheduleService service;
	

	@GetMapping("/sHome")
	public String scheduleHome(HttpServletRequest request, Model model) {
		String userId = (String)request.getSession().getAttribute("userId");
		List<Map<String, Object>> dataMap = service.getYS(userId);
		model.addAttribute("dataMap",dataMap);
		return "student/schedule/timeTable";
	}
	
	
	@ResponseBody
	@PostMapping(value = "/showList")
	public ResponseEntity<List<Map<String,Object>>> scheduleList(HttpServletRequest request, @RequestBody Map<String, Object> dataMap) {
		ResponseEntity<List<Map<String,Object>>> entity = null;
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		dataMap.put("smem_no", userId);
		
		List<Map<String,Object>> dataList = service.getMyTimeTable(dataMap);
		
		entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
		
		return entity;
	}
	
	
	@ResponseBody
	@GetMapping(value = "/timetable")
	public ResponseEntity<List<Map<String, Object>>> mytimeTable(HttpServletRequest request){
		String userId = (String )request.getSession().getAttribute("userId");
		
		List<Map<String, Object>> dataList = service.getMyTimeTableAll(userId);
		
		return new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
	}
	
	
}
