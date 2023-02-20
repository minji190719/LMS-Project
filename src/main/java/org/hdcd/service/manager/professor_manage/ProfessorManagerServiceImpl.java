package org.hdcd.service.manager.professor_manage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.ProfessorManagerMapper;
import org.springframework.stereotype.Service;

@Service
public class ProfessorManagerServiceImpl implements ProfessorManagerService{
	
	@Inject
	ProfessorManagerMapper professorManagerMapper;
	
	@Override
	public List<Map<String, Object>> getProfessorList(String professorDepartment, String professorPosition, String professorName) {
		// TODO Auto-generated method stub
		return professorManagerMapper.getProfessorList(professorDepartment, professorPosition, professorName);
	}

	@Override
	public Map<String, Object> getProfessorDetail(String mem_no) {
		// TODO Auto-generated method stub
		return professorManagerMapper.getProfessorDetail(mem_no);
	}

	@Override
	public int positionChange(String objmem_no, String objposition) {
		// TODO Auto-generated method stub
		return professorManagerMapper.positionChange(objmem_no, objposition);
	}

}
