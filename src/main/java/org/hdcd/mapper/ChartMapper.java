package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.DepartmentVO;

public interface ChartMapper {

	List<DepartmentVO> getDepartmentInfo();

	List<Map<String, Object>> getChartData(@Param("stu_schyear")String stu_schyear, @Param("stu_gender")String stu_gender, @Param("stu_dep") String stu_dep);

	List<Map<String, Object>> getCollAvgPriceChartDataList();

	List<Map<String, Object>> getDepAvgPriceChartDataList();

	List<Map<String, Object>> getSurStatScore(@Param("stu_schyear")String stu_schyear, @Param("stu_gender")String stu_gender, @Param("stu_dep")String stu_dep);

	Map<String, Object> getSurDetailStatScore(@Param("sur_question")String sur_question, @Param("stu_schyear")String stu_schyear, @Param("stu_gender")String stu_gender,
			@Param("stu_dep")String stu_dep, @Param("i")int i);
	
}
