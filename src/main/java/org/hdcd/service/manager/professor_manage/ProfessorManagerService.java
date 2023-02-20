package org.hdcd.service.manager.professor_manage;

import java.util.List;
import java.util.Map;

public interface ProfessorManagerService {

	List<Map<String, Object>> getProfessorList(String professorDepartment, String professorPosition, String professorName);

	Map<String, Object> getProfessorDetail(String mem_no);

	int positionChange(String objmem_no, String objposition);

}
