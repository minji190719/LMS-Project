package org.hdcd.service.manager.chart;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.DepartmentVO;

public interface ChartService {

	List<DepartmentVO> getDepartmentInfo();

	List<Map<String, Object>> getChartData(String stu_schyear, String stu_gender, String stu_dep);

	List<Map<String, Object>> getCollAvgPriceChartDataList();

	List<Map<String, Object>> getDepAvgPriceChartDataList();

	List<Map<String, Object>> getSurStatScore(String stu_schyear, String stu_gender, String stu_dep);

	List<Map<String, Object>> getSurDetailStatScore(String sur_question, String stu_schyear, String stu_gender,
			String stu_dep);
	
}
