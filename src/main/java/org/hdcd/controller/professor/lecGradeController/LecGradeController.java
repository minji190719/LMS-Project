package org.hdcd.controller.professor.lecGradeController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.type.JdbcType;
import org.hdcd.service.professor.lecture.LectureGradeService;
import org.hdcd.vo.LecGradeVO;
import org.hdcd.vo.ProfessorVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnore;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor")
public class LecGradeController {

   @Inject
   LectureGradeService service;
   
   @GetMapping("/lecGrade")
   public String lecGradeMain() {
      return "professor/lecGrade/lecGradeMain";
   }
   
   @GetMapping("/myLecList")
   public ResponseEntity<List<Map<String, Object>>> myLecList(HttpServletRequest request){
	   
	   ResponseEntity<List<Map<String, Object>>> entity = null;

	   HttpSession session = request.getSession();
	   String userId = (String) session.getAttribute("userId");
	   ProfessorVO professor = new ProfessorVO();
	   professor.setPmem_no(userId);
	   
	   List<Map<String,Object>> dataList = service.getMyLecList(professor);
	   
	   entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);
	   
	   // 성적테이블에 해당 강의코드가 들어있는 지 확인 (들어있으면 이미 성적등록을 마친 상태임)
	   //                               (들어있지 않으면 성적등록을 마친 상태가 아님)
	   String lecCode="";
	   for(Map<String,Object> dataKey : dataList) {
		   lecCode = (String)dataKey.get("LEC_CODE");
		   // state가 0이면 미등록 상태 1이면 등록상태
		   if(checkGradeInsert(lecCode)) {
			   dataKey.put("state", 1);
		   }else {
			   dataKey.put("state", 0);
		   }
	   }
	   
	   return entity;
	   
   }
   
   
   private boolean checkGradeInsert(String lecCode) {
	   
	   int cnt = service.checkGradeInsert(lecCode);
	   // 이미 등록됨
	   if(cnt > 0) {
		  return true;
	   }
	   return false;
   }

   @ResponseBody
   @PostMapping("/lecGrade/list")
   public ResponseEntity<List<Map<String,Object>>> lecGradeList(HttpServletRequest request, String lecCode) {
       ResponseEntity<List<Map<String,Object>>> entity = null;
       
       HttpSession session = request.getSession();
       String pMemNo = (String)session.getAttribute("userId");
       
       Map<String, Object> dataMap = new HashMap<String, Object>();
       
       dataMap.put("pMemNo",pMemNo);      
       dataMap.put("lecCode", lecCode);
       // 내 강의 리스트 뽑아와보자....
       List<Map<String, Object>> dataList = service.getGradeInfo(dataMap);
       
       for(Map<String, Object> key : dataList) {
          key.remove("MEM_PHOTONM");
       }
       
       entity = new ResponseEntity<List<Map<String,Object>>>(dataList, HttpStatus.OK);

       log.debug("{}",dataList);
       
       return entity;
   }
      
   @ResponseBody
   @PostMapping(value="/lecGrade/insert")
   public ResponseEntity<String> updateGrade(@RequestBody List<Map<String,Object>> jsonData){
	   
	   ResponseEntity<String> entity = null;
	   log.debug("jsonData {} ",jsonData);
	   
	   // LEC_CODE 와 SMEM_NO
	   int cnt = service.insertAllGrade(jsonData);
	   
	   entity = new ResponseEntity<String>("success", HttpStatus.OK);
			   
	   return entity;
   }
   
   
   
   
   
}