package org.hdcd.controller.manager.professor_manage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.service.manager.professor_manage.ProfessorManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import android.hardware.Camera.Face;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Mprofessor")
public class ProfessorManagerController {
	
	@Inject
	ProfessorManagerService professorManagerService;
	
	/**
	 * [교수 조회 페이지 요청]
	 * @return manager/professorList.jsp
	 */
	@GetMapping("/professorAllList")
	public String professorAllList() {
		return "manager/professorList";
	}
	
	/**
	 * [교수 데이터 요청]
	 * @param professorDepartment
	 * @param professorPosition
	 * @param professorName
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@PostMapping(value = "/getProfessorList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>>getProfessorList(@RequestParam(required = false) String professorDepartment, 
													@RequestParam(required = false) String professorPosition,
													@RequestParam(required = false) String professorName) {
		
		List<Map<String, Object>> getProfessorList = professorManagerService.getProfessorList(professorDepartment, professorPosition, professorName);
		
		log.info("교수 리스트 : {}", getProfessorList);
		
		return getProfessorList;
		
	}
	
	/**
	 * [교수의 상세정보]
	 * @param mem_no
	 * @return Map<String, Object> 
	 */
	@ResponseBody
	@PostMapping(value = "/getProfessorDetail", produces = "application/json;charset=utf-8")
	public Map<String, Object>getProfessorDetail(String mem_no) {
		
		Map<String, Object> getProfessorDetail = professorManagerService.getProfessorDetail(mem_no);
		
		log.info("교수 디테일 : {}", getProfessorDetail);
		
		return getProfessorDetail;
		
	}
	
	/**
	 * [교수 직급변경 신청]
	 * @param objmem_no
	 * @param objposition
	 * @return 신청 성공시 OK 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/positionChange", produces = "text/plain;charset=utf-8")
	public String positionChange(String objmem_no, String objposition) {
		
		log.debug("변경할 교수 번호 : {}", objmem_no); 
		log.debug("변경할 직책 : {}", objposition); 
		
		
		int positionChange = professorManagerService.positionChange(objmem_no, objposition);
		
		
		
		if(positionChange > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	
	
}
