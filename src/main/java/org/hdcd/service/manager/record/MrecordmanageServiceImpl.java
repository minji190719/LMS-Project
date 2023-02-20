package org.hdcd.service.manager.record;

import java.util.List;
import java.util.Map;

import org.hdcd.mapper.MrecordmanageMapper;
import org.hdcd.vo.RecordApplyListVO;
import org.hdcd.vo.RecordApplyVO;
import org.hdcd.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MrecordmanageServiceImpl implements MrecordmanageService{
	
	@Autowired
	MrecordmanageMapper mapper;
	
	@Override
	public List<RecordApplyListVO>selectAllList()throws Exception {
		return mapper.selectAllList();
	}

	@Override
	public int AppRecord(RecordApplyVO recordapplyVo) {
		return mapper.AppRecord(recordapplyVo);
	}

	@Override
	public List<Map<String, Object>> selectsNo(Map<String, Object> dataMap) throws Exception {
		return mapper.selectsNo(dataMap);
	}

	@Override
	public int updateRecord(RecordApplyVO recordapplyVo) throws Exception {
		return mapper.updateRecord(recordapplyVo);
	}

	@Override
	public int validationRecord(RecordApplyVO recordapplyVo) throws Exception {
		return mapper.validationRecord(recordapplyVo);
	}

	@Override
	public int updateStudent(String smem_no) throws Exception {
		return mapper.updateStudent(smem_no);
	}

	@Override
	public int updateStudentre(String smem_no) throws Exception {
		return mapper.updateStudentre(smem_no);
	}




}
