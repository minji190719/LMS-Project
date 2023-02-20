package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.ProfessorVO;

public interface PLectureMapper {

	List<Map<String, Object>> getGradeInfo(Map<String, Object> dataMap);

	List<Map<String, Object>> getMyLecList(ProfessorVO professor);

	int insertGrade(Map<String, Object> student);

	int checkGradeInsert(String lecCode);

}
