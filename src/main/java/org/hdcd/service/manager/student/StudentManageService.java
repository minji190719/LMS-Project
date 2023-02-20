package org.hdcd.service.manager.student;

import java.util.List;
import java.util.Map;

public interface StudentManageService {

	public List<Map<String, Object>> getAllStudent(String stu_dep,String stu_record, String mem_name);

	public Map<String, Object> getStudentDetail(String smem_no);

}
