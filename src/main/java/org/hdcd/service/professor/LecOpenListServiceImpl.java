package org.hdcd.service.professor;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.LecOpenListMapper;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecturePlanVO;
import org.springframework.stereotype.Service;

@Service
public class LecOpenListServiceImpl implements ILecOpenListService{
	
	@Inject
	private LecOpenListMapper mapper;

	@Override
	public int insertLecList(LecOpenListVO lecOpenListVO) throws Exception{
		int cnt = mapper.insertLecList(lecOpenListVO);
		return  cnt; 
	}

	@Override
	public void insertLecPlan(LecturePlanVO lecturePlanVO) throws Exception {
		mapper.insertLecPlan(lecturePlanVO);
		
	}

	@Override
	public List<LecOpenListVO> selectList(String userId) throws Exception {
		return mapper.selectList(userId);
	}

	@Override
	public int deleteLecList(String lolCode) throws Exception {
		return mapper.deleteLecList(lolCode);
		
	}

	@Override
	public LecOpenListVO selectOneLol(String lolCode) throws Exception {
		return mapper.selectOneLol(lolCode);
	}

	@Override
	public LecturePlanVO selectOneLp(String lolCode) throws Exception {
		return mapper.selectOneLp(lolCode);
	}

	@Override
	public int updateLecOpenList(LecOpenListVO lecOpenListVO) throws Exception {
		return mapper.updateLecOpenList(lecOpenListVO);
	}

	@Override
	public int updateLecPlan(LecturePlanVO lecturePlanVO) throws Exception {
		return mapper.updateLecPlan(lecturePlanVO);
	}

	@Override
	public List<Map<String, Object>> selectLecList(String userId) throws Exception {
		return mapper.selectLecList(userId);
		
	}

	@Override
	public int updatePLecture(String lecCode) throws Exception {
		return mapper.updatePLecture(lecCode);
	}

	@Override
	public List<Map<String, Object>> selectLecturePlanList(String userId) throws Exception {
		return mapper.selectLecturePlanList(userId);
	}

	@Override
	public List<LecturePlanVO> selectOneLecPlan(String lolCode) throws Exception {
		return mapper.selectOneLecPlan(lolCode);
	}

	@Override
	public int updatePLectureZero(String lecCode) throws Exception {
		return mapper.updatePLectureZero(lecCode);
	}

	@Override
	public Map<String, Object> selectProfessorMyInfo(String userId) throws Exception {
		return mapper.selectProfessorMyInfo(userId);
	}



}
