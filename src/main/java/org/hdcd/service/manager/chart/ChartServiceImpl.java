package org.hdcd.service.manager.chart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.ChartMapper;
import org.hdcd.vo.DepartmentVO;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Inject
	ChartMapper chartMapper;
	
	@Override
	public List<DepartmentVO> getDepartmentInfo() {
		// TODO Auto-generated method stub
		return chartMapper.getDepartmentInfo();
	}

	@Override
	public List<Map<String, Object>> getChartData(String stu_schyear, String stu_gender, String stu_dep) {
		// TODO Auto-generated method stub
		return chartMapper.getChartData(stu_schyear, stu_gender, stu_dep);
	}

	@Override
	public List<Map<String, Object>> getCollAvgPriceChartDataList() {
		// TODO Auto-generated method stub
		return chartMapper.getCollAvgPriceChartDataList();
	}

	@Override
	public List<Map<String, Object>> getDepAvgPriceChartDataList() {
		// TODO Auto-generated method stub
		return chartMapper.getDepAvgPriceChartDataList();
	}

	@Override
	public List<Map<String, Object>> getSurStatScore(String stu_schyear, String stu_gender, String stu_dep) {
		// TODO Auto-generated method stub
		return chartMapper.getSurStatScore(stu_schyear, stu_gender, stu_dep);
	}

	@Override
	public List<Map<String, Object>> getSurDetailStatScore(String sur_question, String stu_schyear, String stu_gender,
			String stu_dep) {
		
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		for(int i = 5; i >= 1; i--) {
			result.add(chartMapper.getSurDetailStatScore(sur_question, stu_schyear, stu_gender, stu_dep, i));
		}
		
		
		
		return result;
	}

}
