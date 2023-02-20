package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.type.JdbcType;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.LecApplyVO;
import org.hdcd.vo.LecGradeVO;
import org.hdcd.vo.LecHistoryVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecSurveyVO;
import org.hdcd.vo.LecturePlanVO;
import org.hdcd.vo.LectureVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.hdcd.vo.StuTimetableVO;

@Mapper
public interface SLectrueMapper {
	
	public List<LecOpenListVO> selectLolAll();

	public ProfessorVO selectPmem(String pMemNo);

	public MemberVO selectMem(String pMemNo);

	public DepartmentVO selectDep(String depCode);

	public LecturePlanVO selectLecP(String lolCode);

	public LecOpenListVO selectLecOpen(String lol_code);

	public List<LectureVO> selectLecAll();

	public void inserApply(LecApplyVO lecApply);

	public List<LecApplyVO> selectLecApplyAll(String userId);

	public LectureVO selectLec(String lecCode);

	public int deleteLecApply(String laCode);

	public LecApplyVO selectLecApplyOne(LecApplyVO lecApply);

	public int insertHis(LecHistoryVO lecHistory);

	public void updateLecApply(LecApplyVO lecApply);

	@Results({
		@Result(property = "MEM_PHOTONM", column = "MEM_PHOTONM", jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	public List<Map<String, Object>> getGradeInfo(Map<String, Object> dataMap);

	public List<Map<String, Object>> getMyLecList(ProfessorVO professor);

	public List<LecGradeVO> getMyGradeList(LecGradeVO lecGrade);

	public List<Map<String, Object>> getMyEvalList(LecGradeVO lecGrade);

	public Map<String, Object> checkEvalState(LecGradeVO lecGrade);

	public int insertLecSurvey(LecSurveyVO lecSurvey);

	public void updateLecGradeState(LecSurveyVO lecSurvey);

	public int insertTimeTable(StuTimetableVO stuTimeTable);

	public void deleteTimeTable(Map<String, Object> dataMap);

	public List<Map<String, Object>> selectAllInfo();

	public List<Map<String, Object>> selectAllmyLecInfo(String userId);

	public Map<String, Object> getAllAboutlecHisInfo(LecApplyVO tmpLecApply);

	public Map<String, Object> getDeleteInfo(LecApplyVO lecApply);

	public Map<String, Object> selectLecInfo(LecApplyVO lecApply);

	public void deleteLecHistory(Map<String, Object> dataMap);

	public List<Map<String, Object>> getNowMyGrade(Map<String, Object> dataMap);

	public Map<String, Object> getAllPlanInfo(String lolCode);

}
