package org.hdcd.controller.manager.chart_manage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.service.manager.chart.ChartService;
import org.hdcd.vo.DepartmentVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chartManage")
@Controller
public class ChartController {
	
	@Inject
	ChartService chartService;
	
	/**
	 * [카테고리별 통계 페이지 요청]
	 * @return manager/mChartPage.jsp
	 */
	@GetMapping("/chartPage")
	public String chartPage() {
		log.debug("chartPage 입니다");
		
		
		return "manager/mChartPage"; 
	}
	
	/**
	 * [학과 데이터 요청]
	 * @return List<DepartmentVO>
	 */
	@ResponseBody
	@PostMapping(value = "/getDepartmentInfo", produces = "application/json;charset=utf-8")
	public List<DepartmentVO> getDepartmentInfo(){
		
		List<DepartmentVO> departmentinfoList = chartService.getDepartmentInfo();
		
		return departmentinfoList;
		
	}
	
	/**
	 * [통계화 할 데이터 요청]
	 * @param param
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@PostMapping(value = "/getChartData", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getChartData(@RequestBody Map<String, String> param){
		
		log.debug("getChartData 로 들어온 값: {}", param);
		
		String stu_schyear = param.get("stu_schyear");
		String stu_gender = param.get("stu_gender");
		String stu_dep = param.get("stu_dep");
		
		List<Map<String, Object>> chartDataList = chartService.getChartData(stu_schyear, stu_gender, stu_dep);
		
		log.debug("리턴 예상값 : {}", chartDataList);
		
		return chartDataList;
		
		
	}
	
	/**
	 * [단과대학별 평균 등록금]
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@PostMapping(value = "/getCollAvgPriceChartData", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getCollAvgPriceChartData(){
		
		log.debug("단과대학별 평균 등록금 메소드 시작");
		
		List<Map<String, Object>> CollAvgPriceChartDataList = chartService.getCollAvgPriceChartDataList();
		
		return CollAvgPriceChartDataList;
		
	}
	
	/**
	 * [학과별 평균 등록금]
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@PostMapping(value = "/getDepAvgPriceChartDataList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getDepAvgPriceChartDataList(){
		
		log.debug("학과별 평균 등록금 메소드 시작");
		
		List<Map<String, Object>> DepAvgPriceChartDataList = chartService.getDepAvgPriceChartDataList();
		
		return DepAvgPriceChartDataList;
		
	}
	
	/**
	 * [설문조사 통계 데이터 요청]
	 * @param param
	 * @return List<Map<String, Object>> 
	 */
	@ResponseBody
	@PostMapping(value = "/getSurStatScore", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getSurStatScore(@RequestBody Map<String, String> param){
		
		log.debug("설문조사 통계 메소드");
		
		log.debug("설문조사 통계 메소드  파라미터 {}", param);
		
		String stu_schyear = param.get("stu_schyear");
		String stu_gender = param.get("stu_gender");
		String stu_dep = param.get("stu_dep");
		
		List<Map<String, Object>> surStatScoreList = chartService.getSurStatScore(stu_schyear, stu_gender, stu_dep);
		
		log.debug("설문조사 통계 메소드 리턴 예상값 {}", surStatScoreList);
		
		return surStatScoreList;
		
	}
	
	/**
	 * [설문조사 문제별 통계 데이터 요청]
	 * @param param
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@PostMapping(value = "/getSurDetailStatScore", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getSurDetailStatScore(@RequestBody Map<String, String> param){
		
		log.debug("설문조사 디테일 통계 메소드");
		
		log.debug("설문조사 통계 디테일 메소드  파라미터 {}", param);
		
		String sur_question = param.get("sur_question");
		String stu_schyear = param.get("stu_schyear");
		String stu_gender = param.get("stu_gender");
		String stu_dep = param.get("stu_dep");
		
		List<Map<String, Object>> surDetailStatScore = chartService.getSurDetailStatScore(sur_question, stu_schyear, stu_gender, stu_dep);
		
		log.debug("설문조사 통계 메소드 리턴 예상값 {}", surDetailStatScore);
		
		return surDetailStatScore;
		
	}
	
	
}
