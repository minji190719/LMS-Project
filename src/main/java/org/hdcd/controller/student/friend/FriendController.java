package org.hdcd.controller.student.friend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.controller.student.schedule.ScheduleController;
import org.hdcd.service.student.friend.FriendService;
import org.hdcd.service.student.schedule.ScheduleService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/friend")
public class FriendController {

	@Inject
	FriendService service;
	
	@Inject
	ScheduleService scheduleService;
	
	@PostMapping(value = "/search")
	public ResponseEntity<String> searchFriend(String memNo) {
		
		int cnt = service.searchFriend(memNo);

		return cnt > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) 
					   : new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping(value = "/insert")
	public ResponseEntity<String> insertFriend(String memNo, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("SMEM_NO", userId);
		dataMap.put("FMEM_NO", memNo);
		
		
		//
		
		int cnt = service.insertFriend(dataMap);
		
		
		
		return cnt > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) 
				       : new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping(value = "/myFriendList")
	public ResponseEntity<List<Map<String,Object>>> myFriendList(HttpServletRequest request){
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		dataList = service.getMyFriendList(userId);
		for(Map<String,Object> dataMap :dataList) {
			dataMap.remove("MEM_PHOTONM");
		}
		
		return dataList.size()>0?new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK)
								:new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping(value = "/myFriendWait", produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Map<String,Object>>> myFriendWait(HttpServletRequest request){
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		dataList = service.getMyFriendWait(userId);
		return dataList.size()>0?new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK)
								:new ResponseEntity<List<Map<String,Object>>>(dataList,HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping(value = "/myFriendRequest", produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Map<String,Object>>> myFriendRequest(HttpServletRequest request){
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		dataList = service.getMyFriendRequest(userId);
		
		return dataList.size() > 0? new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK)
								  : new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping(value = "/timeTable", produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Map<String,Object>>> getTimeTable(@RequestBody Map<String, Object> data, HttpServletRequest request){
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("smem_no", data.get("smem_no"));
		dataMap.put("year", 2022);
		dataMap.put("semester", 2);
		
		dataList = scheduleService.getMyTimeTable(dataMap);
		
		return dataList.size() > 0?new ResponseEntity<List<Map<String,Object>>>(dataList,HttpStatus.OK)
								  :new ResponseEntity<List<Map<String,Object>>>(dataList,HttpStatus.BAD_REQUEST);
	}
 	
	
	
	@ResponseBody
	@PostMapping(value = "/delete")
	public ResponseEntity<String> deleteRequest(@RequestBody Map<String, Object> dataMap, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		dataMap.put("userId", userId);
		int cnt = service.deleteFriendRequest(dataMap);
		
		return cnt > 0? new ResponseEntity<String>("success", HttpStatus.OK)
					   :new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping(value = "/update")
	public ResponseEntity<Map<String, Object>> insertRequest(@RequestBody Map<String, Object> dataMap, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		dataMap.put("userId", userId);
		dataMap = service.updateRequest(dataMap);
		dataMap.remove("MEM_PHOTONM");
		
		return dataMap!=null?new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK)
							:new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.BAD_REQUEST);
	}
	
	
	
	
}
