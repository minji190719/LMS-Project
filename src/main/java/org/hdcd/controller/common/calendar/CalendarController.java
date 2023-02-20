package org.hdcd.controller.common.calendar;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.calendar.CalendarService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Inject
	CalendarService service;
	
	@GetMapping("/main")
	public String calHome(){
		return "common/calendar/universityCalendar";
	}
	
	
	@ResponseBody
	@PostMapping(value = "/showList")
	public ResponseEntity<List<Map<String,Object>>> showList(@RequestBody Map<String, Object> dataMap){
		
		List<Map<String,Object>> dataList = service.getCalendarList(dataMap);
		
		return new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
	}
	
	@PostMapping(value = "/showList2")
	public ResponseEntity<List<Map<String,Object>>> showList2(@RequestBody Map<String, Object> dataMap, HttpServletRequest request){
		
		String userId = (String)request.getSession().getAttribute("userId");
		dataMap.put("userId", userId);
		List<Map<String,Object>> dataList = service.getCalendarList2(dataMap);
		
		return new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/insertCal")
	public ResponseEntity<Map<String,Object>> insertCal(@RequestBody Map<String,Object> dataMap, HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("userId");
		dataMap.put("memNo", userId);
		dataMap.put("category", userId);
		dataMap.put("check", 0);
		dataMap.put("groupId", "0");
		
		int cnt = service.insertCal(dataMap);
		dataMap = service.getCalDetail((String)dataMap.get("groupId"));
		
		return cnt>0?new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK):
					 new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.BAD_REQUEST);
	}
	
	
	@ResponseBody
	@PostMapping(value = "/detail")
	public ResponseEntity<Map<String, Object>> detailCal(String groupId){
		
		Map<String, Object> dataMap = service.getCalDetail(groupId);
		
		return dataMap.size()>0?new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK):
								new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.BAD_REQUEST);
	}
	
	
	@ResponseBody
	@PostMapping(value = "/update")
	public ResponseEntity<String> updateCal(@RequestBody Map<String,Object> dataMap){
		
		int cnt = service.updateCal(dataMap);
		if(dataMap.containsKey("start")) {
			cnt = 2;
		}
		
		
		return cnt == 1?new ResponseEntity<String>("success",HttpStatus.OK)
					   : new ResponseEntity<String>("success2",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/checkboxUpdate")
	public ResponseEntity<String> checkboxUpdate(@RequestBody Map<String,Object> dataMap){
		int cnt = service.updateCheckBox(dataMap);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/deleteCal")
	public ResponseEntity<String> deleteCal(@RequestBody Map<String,Object> dataMap){
		int cnt = service.deleteCal(dataMap);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	
	
	
	
	
}
