package org.hdcd.controller.student.lecture;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.lecture.StudentLectureService;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.LecApplyVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecturePlanVO;
import org.hdcd.vo.LectureVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/prelecture")
public class PreLectureController {
   
   @Inject
   StudentLectureService service;
   
   @GetMapping(value = "/home")
   public String lectureHome() {
      return "member/student/prelectureHome";
   }
   
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public ResponseEntity<List<List<Map<String, Object>>>> lectureList2(HttpServletRequest request) {
      
      ResponseEntity<List<List<Map<String, Object>>>> entity = null;
      
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute("userId");
      
      List<List<Map<String, Object>>> totalList = new ArrayList<List<Map<String,Object>>>();
      
      // 강의목록에 관련된 정보 모두 출력
      List<Map<String, Object>> dataList = service.selectLecList();
      
      // 맴버 포토 잠시만 뻄
      for(Map<String, Object> dataMap : dataList) {
    	  dataMap.remove("MEM_PHOTONM");
      }
      
      // 수강바구니에 관련된 정보 모두 출력
      List<Map<String, Object>> myLecApplyList = service.selectMyLecApply(userId);
      
      // 여기서도 잠시 뺌
      for(Map<String, Object> dataMap : myLecApplyList) {
    	  dataMap.remove("MEM_PHOTONM");
      }
      
      
      totalList.add(dataList);
      totalList.add(myLecApplyList);
      
      
      entity = new ResponseEntity<List<List<Map<String,Object>>>>(totalList, HttpStatus.OK);
      
      return entity;
   }
   
   @ResponseBody
   @PostMapping(value = "/showPlan", produces = "application/json; charset=utf-8")
   public ModelAndView showPlan(LecturePlanVO tmplecturePlanVO, MemberVO member, LecOpenListVO lecOpenList){
      
      ModelAndView mav = new ModelAndView();
      Map<String, Object> dataMap = new HashMap<String,Object>();
      
      String lolCode = tmplecturePlanVO.getLol_code();
      
      // 일단 나중에 서비스 한곳에 몰아 넣기
      // 데이터 한번에 뽑기
      dataMap = service.getAllPlanInfo(lolCode);
      
//      // 강좌 정보 뽑기
//      LecOpenListVO lecOpenListVO = service.selectLecOpen(lecOpenList.getLol_code());
//      
//      // 강의계획서 뽑기
//      LecturePlanVO lecturePlanVO = service.selectLecP(lolCode);
//      
//      // 맴버 정보 뽑기
//      MemberVO memberVO = service.selectMem(member.getMem_no());
//      
//      // 교수정보 뽑기
//      ProfessorVO professorVO = service.selectPmem(member.getMem_no());
//      
//      // 학과정보 뽑기
//      DepartmentVO departmentVO = service.selectDep(professorVO.getDep_code());
      
//      dataMap.put("lecturePlanVO", lecturePlanVO);
//      dataMap.put("lecOpenListVO", lecOpenListVO);
//      dataMap.put("memberVO", memberVO);
//      dataMap.put("professorVO", professorVO);
//      dataMap.put("departmentVO", departmentVO);
      
      mav.addObject("dataMap", dataMap);
      mav.setViewName("common/lecture/notiles/lecturePlan");
      
      return mav;
   }
   
   
   // 예비 수강바구니 등록
   @ResponseBody
   @PostMapping(value = "/insertLec")
   public ResponseEntity<Map<String, Object>> insertLec(HttpServletRequest request, @RequestBody LecApplyVO lecApply) {
	   
	  Map<String, Object> dataMap = new HashMap<String, Object>();
	  ResponseEntity<Map<String, Object>> entity = null;
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute("userId");
      
      lecApply.setSmem_no(userId);
      
      // lecCode 를 전송함
      boolean flag = checkLec(lecApply);
      
      if(flag) {
    	  entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.BAD_REQUEST);
    	  return entity;
      }
      
      service.inserApply(lecApply);
      
      dataMap = service.selectLecInfo(lecApply);
      
//      LectureVO lecture = service.selectLec(lecApply.getLec_code());
//      LecOpenListVO lecOpenList = service.selectLecOpen(lecture.getLol_code());
//      dataMap.put("lecOpenList", lecOpenList);
//      dataMap.put("lecApply", lecApply);
      
      
      if(lecApply.getLa_code() == null) {
    	 entity = new ResponseEntity<Map<String,Object>>(HttpStatus.OK);
         return entity;
      }
      
      entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
      
      return entity;
   }
   
   @ResponseBody
   @PostMapping(value = "/deletetLec/{state}")
   public ResponseEntity<Map<String, Object>> deletetLec(@PathVariable int state, LecApplyVO lecApply, HttpServletRequest request) {
      
	  ResponseEntity<Map<String, Object>> entity = null;
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute("userId");
      
      lecApply.setSmem_no(userId);
      lecApply.setLa_state(state);

      Map<String, Object> dataMap = new HashMap<String, Object>();
      dataMap.put("SMEM_NO", lecApply.getSmem_no());
      dataMap.put("LA_CODE", lecApply.getLa_code());
      dataMap.put("ST_YEAR", 2023);
      dataMap.put("ST_SEMESTER", 1);
      if(state == 1) {
    	  service.deleteLecHistory(dataMap);
    	  service.deleteTimeTable(dataMap);
    	  // lec_history도 지워야 합니다.
      }
      
      dataMap = service.deleteLecApply(lecApply);
      
      if(dataMap != null) {
    	  entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
      }
      
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
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}