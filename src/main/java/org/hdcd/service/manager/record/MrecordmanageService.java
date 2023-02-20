package org.hdcd.service.manager.record;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.RecordApplyListVO;
import org.hdcd.vo.RecordApplyVO;
import org.hdcd.vo.StudentVO;

public interface MrecordmanageService {
	List<RecordApplyListVO> selectAllList()throws Exception;
	
	int AppRecord(RecordApplyVO recordapplyVo);
	
	List<Map<String, Object>> selectsNo(Map<String, Object> dataMap)throws Exception;
	
	
	int updateStudent(String smem_no)throws Exception;
	
	int validationRecord(RecordApplyVO recordapplyVo)throws Exception;
	
	int updateRecord(RecordApplyVO recordapplyVo)throws Exception;
	
	int updateStudentre(String smem_no)throws Exception;
	
}
	