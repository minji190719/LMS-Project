package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecturePlanVO;

public interface LecOpenListMapper {

	public int insertLecList(LecOpenListVO lecOpenListVO) throws Exception;

	public void insertLecPlan(LecturePlanVO lecturePlanVO) throws Exception;

	public List<LecOpenListVO> selectList(String userId) throws Exception;

	public int deleteLecList(String lolCode) throws Exception;

	public LecOpenListVO selectOneLol(String lolCode) throws Exception;

	public LecturePlanVO selectOneLp(String lolCode) throws Exception;

	public int updateLecOpenList(LecOpenListVO lecOpenListVO) throws Exception;

	public int updateLecPlan(LecturePlanVO lecturePlanVO) throws Exception;

	public List<Map<String, Object>> selectLecList(String userId) throws Exception;

	public int updatePLecture(String lecCode) throws Exception;

	public List<Map<String, Object>> selectLecturePlanList(String userId) throws Exception;

	public List<LecturePlanVO> selectOneLecPlan(String lolCode) throws Exception;

	public int updatePLectureZero(String lecCode) throws Exception;

	public Map<String, Object> selectProfessorMyInfo(String userId) throws Exception;


	
	
		
}
