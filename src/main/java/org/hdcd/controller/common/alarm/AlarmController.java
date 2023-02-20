package org.hdcd.controller.common.alarm;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.alarm.AlarmService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

	
	@Inject
	AlarmService service;
	
	@GetMapping("/list")
	public ResponseEntity<List<Map<String,Object>>> alarmList(HttpServletRequest request){
	
		String userId = (String) request.getSession().getAttribute("userId");
		List<Map<String, Object>> dataList = service.getAlarmList(userId);
		
		return new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
	}
	
	@GetMapping("/delete/{alarmNo}")
	public String deleteAlarm(@PathVariable String alarmNo) {
		
		if(alarmNo.equals("null")) {
			alarmNo=null;
		}
		
		int cnt = service.deleteAlarm(alarmNo);
		
		return "success";
	}
	
}
