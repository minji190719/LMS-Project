package org.hdcd.service.manager.student;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.MStudentManageMapper;
import org.springframework.stereotype.Service;

@Service
public class StudentManageServiceImpl implements StudentManageService{
	
	@Inject
	private MStudentManageMapper mapper;
	
	@Override
	public List<Map<String, Object>> getAllStudent(String stu_dep,String stu_record, String mem_name) {
		// TODO Auto-generated method stub
		return mapper.selectAllStudent(stu_dep,stu_record,mem_name);
	}

	@Override
	public Map<String, Object> getStudentDetail(String smem_no) {
		// TODO Auto-generated method stub
		return mapper.selectStudentDetail(smem_no);
	}

}
