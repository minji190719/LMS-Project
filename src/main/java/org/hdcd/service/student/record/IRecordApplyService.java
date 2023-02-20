package org.hdcd.service.student.record;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.RecordApplyVO;

public interface IRecordApplyService {
	
	public List<RecordApplyVO> selectAllrecordapply(RecordApplyVO recordVO) throws Exception;
	
	public List<RecordApplyVO> selectrecordapplyByNo(String smem_no)throws Exception;

	int add_to_record(RecordApplyVO recordVO) throws Exception;
	
	int delete_to_record(String rcrda_code)throws Exception;

	Map<String, Object> selectinfoByNo(String smem_no) throws Exception;
	
	
}
