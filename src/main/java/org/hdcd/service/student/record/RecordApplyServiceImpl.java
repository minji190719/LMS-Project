package org.hdcd.service.student.record;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.SRecordApplyMapper;
import org.hdcd.vo.RecordApplyVO;
import org.springframework.stereotype.Service;

@Service
public class RecordApplyServiceImpl implements IRecordApplyService {
	
	@Inject
	private SRecordApplyMapper srecordapplymapper;
	

	@Override
	public List<RecordApplyVO> selectAllrecordapply(RecordApplyVO recordVO) throws Exception {
		return srecordapplymapper.selectAllrecordapply(recordVO);
	}

	@Override
	public List<RecordApplyVO> selectrecordapplyByNo(String smem_no) throws Exception {
		return srecordapplymapper.selectrecordapplyByNo(smem_no);
	}

	@Override
	public int add_to_record(RecordApplyVO recordVO)throws Exception {
		int res = srecordapplymapper.add_to_record(recordVO);
		return res;
		
	}

	@Override
	public Map<String, Object> selectinfoByNo(String smem_no) throws Exception {
		return srecordapplymapper.selectinfoByNo(smem_no);
	}

	@Override
	public int delete_to_record(String rcrda_code) throws Exception {
		int dres = srecordapplymapper.delete_to_record(rcrda_code);
		return dres;
	} 
		
}

