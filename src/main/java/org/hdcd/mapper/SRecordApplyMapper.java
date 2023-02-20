package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.RecordApplyVO;

@Mapper
public interface SRecordApplyMapper {

	
	public List<RecordApplyVO> selectAllrecordapply(RecordApplyVO recordVO) throws Exception;
	
	public List<RecordApplyVO> selectrecordapplyByNo(String smem_no)throws Exception;
	
	public int add_to_record(RecordApplyVO recordVO)throws Exception;
	
	Map<String, Object> selectinfoByNo(String smem_no)throws Exception;
	
	int delete_to_record(String rcrda_code)throws Exception;
}
