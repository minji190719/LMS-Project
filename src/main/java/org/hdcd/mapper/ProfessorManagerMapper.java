package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProfessorManagerMapper {

	List<Map<String, Object>> getProfessorList(@Param("professorDepartment")String professorDepartment,
												@Param("professorPosition")String professorPosition,
												@Param("professorName")String professorName);

	Map<String, Object> getProfessorDetail(String mem_no);

	int positionChange(@Param("objmem_no")String objmem_no, @Param("objposition")String objposition);

}
