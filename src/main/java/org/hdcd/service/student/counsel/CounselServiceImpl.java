package org.hdcd.service.student.counsel;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.CounselMapper;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.CounselVO;
import org.hdcd.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class CounselServiceImpl implements CounselService{
	
	@Inject
	CounselMapper mapper;
	
	@Override
	public List<CounselApplyVO> counselApplyList(String userId) {
		return mapper.counselApplyList(userId);
	}

	@Override
	public List<CounselVO> getCounselList() {
		return mapper.getCounselList();
	}

	@Override
	public MemberVO counselNameList(String pmem_no) {
		return mapper.counselNameList(pmem_no);
	}

	@Override
	public int apply(CounselApplyVO counselApplyVO) {
		// TODO Auto-generated method stub
		return mapper.apply(counselApplyVO);
	}

	@Override
	public MemberVO proffsorNameList(String cnsl_code) {
		// TODO Auto-generated method stub
		return mapper.proffsorNameList(cnsl_code);
	}

	@Override
	public int updateState(String cnsl_code) {
		// TODO Auto-generated method stub
		return mapper.updateState(cnsl_code);
	}

	@Override
	public int counselReturn(CounselApplyVO counselApplyVO) {
		// TODO Auto-generated method stub
		return mapper.studentCounselReturn(counselApplyVO);
	}

	@Override
	public List<CounselVO> getSearchCounselList(String searchName, String searchDate, String searchSelect) {
		
		return mapper.getSearchCounselList(searchName, searchDate, searchSelect);
	}

	@Override
	public List<CounselApplyVO> counselApplyListSearch(String searchProfessorName, String searchState,
			String searchType, String userId) {
		// TODO Auto-generated method stub
		return mapper.counselApplyListSearch(searchProfessorName, searchState, searchType, userId);
	}

	@Override
	public CounselVO counselApplyDetail(String cnsl_code) {
		// TODO Auto-generated method stub
		return mapper.counselApplyDetail(cnsl_code);
	}


}
