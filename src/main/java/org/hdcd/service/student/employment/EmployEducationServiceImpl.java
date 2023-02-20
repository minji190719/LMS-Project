package org.hdcd.service.student.employment;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.EmployEducationMapper;
import org.hdcd.vo.EmployApplyVO;
import org.hdcd.vo.EmployProgramVO;
import org.springframework.stereotype.Service;

@Service
public class EmployEducationServiceImpl implements EmployEducationService{

	@Inject
	EmployEducationMapper employEducationMapper; 
	
	@Override
	public List<EmployProgramVO> getEmployEducationProgram(String searchWord) {
		// TODO Auto-generated method stub
		return employEducationMapper.getEmployEducationProgram(searchWord);
	}


	@Override
	public EmployProgramVO employEducationProgramDetailPage(String epro_code) {
		// TODO Auto-generated method stub
		return employEducationMapper.employEducationProgramDetailPage(epro_code);
	}

	@Override
	public int employEducationProgramApply(String epro_code, String userId) {
		// TODO Auto-generated method stub
		return employEducationMapper.employEducationProgramApply(epro_code, userId);
	}

	@Override
	public EmployApplyVO employEducationProgramApplyValidation(String epro_code, String userId) {
		// TODO Auto-generated method stub
		employEducationMapper.IncrementEproCurcnt(epro_code);
		return employEducationMapper.employEducationProgramApplyValidation(epro_code, userId);
	}

}
