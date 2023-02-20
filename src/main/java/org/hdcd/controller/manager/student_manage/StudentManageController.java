package org.hdcd.controller.manager.student_manage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.service.manager.student.StudentManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/Mstudent")
public class StudentManageController {
	
	@Inject
	private StudentManageService service;
	
	/**
	 * [관리자] 학생조회 페이지 이동 메서드
	 * @return manager/studentList
	 */
	@GetMapping("/studentAllList")
	public String getAllStudentListForm() {
		log.debug("getAllStudentListForm 페이지로 이동합니다");
		
		return "manager/studentList";
	}
	
	
	/**
	 * [관리자] 학생 총 리스트 불러오는 메서드 (검색 포함)
	 * @param stu_dep
	 * @param stu_record
	 * @param mem_name
	 * @return studentList
	 */
	@ResponseBody
	@GetMapping(value = "/getAllStudentList",produces = "application/json;charset=UTF-8")
	public List<Map<String, Object>> getAllProfessorList(String stu_dep,String stu_record, String mem_name) {
		log.debug("getAllProfessorList 시작합니다");
		
		List<Map<String, Object>> studentList = service.getAllStudent(stu_dep,stu_record,mem_name);
		
		return studentList;
	}
	
	/**
	 * [관리자] 학생별 상세정보 불러오는 메서드
	 * @param smem_no
	 * @return Map
	 */
	@ResponseBody
	@GetMapping(value = "/getStudentDetail" ,produces = "application/json;charset=UTF-8")
	public Map<String, Object> getStudentDetail(String smem_no){
		log.debug("getStudentDetail 시작합니다 ");
		
		Map<String, Object> detailMap = service.getStudentDetail(smem_no);
		
		return detailMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
