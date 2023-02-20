package org.hdcd.service.professor;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.CounselMapper;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.MemberVO;
import org.springframework.stereotype.Service;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfessorCounselServiceImpl implements ProfessorCounselService{
	
	@Inject
	CounselMapper counselMapper;
	
	@Override
	public List<CounselApplyVO> professorApplyCounsel(String professorSessionId) {
		return counselMapper.professorApplyCounsel(professorSessionId);
	}

	@Override
	public MemberVO getStudentName(String smem_no) {
		// TODO Auto-generated method stub
		return counselMapper.getStudentName(smem_no);
	}

	@Override
	public int counselReturn(CounselApplyVO counselApplyVO) {
		// TODO Auto-generated method stub
		return counselMapper.counselReturn(counselApplyVO);
	}

	@Override
	public int counselValidation(CounselApplyVO counselApplyVO) {
		// TODO Auto-generated method stub
		int res = counselMapper.counselValidationTo(counselApplyVO);
		log.info("================================= 승인 트리거 (교수서비스임플) : {}", res);
		return counselMapper.counselValidation(counselApplyVO);
	}

}
