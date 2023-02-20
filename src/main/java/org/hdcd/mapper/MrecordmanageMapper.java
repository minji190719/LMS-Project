package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.RecordApplyListVO;
import org.hdcd.vo.RecordApplyVO;
import org.hdcd.vo.StudentVO;

@Mapper
public interface MrecordmanageMapper {
	List<RecordApplyListVO>selectAllList() throws Exception;
	
	int AppRecord(RecordApplyVO recordapplyVo);
	
	List<Map<String, Object>> selectsNo(Map<String, Object> dataMap)throws Exception;
	
	int validationRecord(RecordApplyVO recordapplyVo)throws Exception;
	
	int updateStudent(String smem_no)throws Exception;
	
	int updateRecord(RecordApplyVO recordapplyVo)throws Exception;
	
	int updateStudentre(String smem_no)throws Exception;
	
	
}

