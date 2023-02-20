package org.hdcd.controller.common.weather;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@RequestMapping("/api")
public class WeatherApi {

	/**
	 * [공통] 기상청 날씨 정보를 불러오는 메서드 
	 * @param model
	 * @return HashMap
	 * @throws Exception
	 */
	@GetMapping("/weather")
	public String apiGetWeather(Model model) throws Exception {
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		// 포맷 적용
		String formatedNow = now.format(formatter);
		log.debug("날짜확인합니다 {}",formatedNow);
		
//		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"+
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"+
					 "?serviceKey=qqu25Nkt%2FGPlfUbJS%2FgBthtCCcTxvf%2B5jn1EPooizRcyBIVTpoSOPjB9EAIsEuFBZjV2uuXHiR31FSjvcNGccw%3D%3D"+
					 "&dataType=JSON"+
					 "&numOfRows=10"+
					 "&pageNo=1"+
					 "&base_date=" + formatedNow + 
					 "&base_time=0800"+
					 "&nx=68"+
					 "&ny=100";
		HashMap<String, Object> resultMap = getDataFromJson(url,"UTF-8","get","");
		
		System.out.println("# RESULT : "+ resultMap);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result",resultMap);
		
		return jsonObj.toString();
	}

	public HashMap<String, Object> getDataFromJson(String url, String encoding, String type,String jsonStr) throws Exception {
		// TODO Auto-generated method stub
		boolean isPost = false;
		
		if("post".equals(type)) {
			isPost = true;
		}else {
			url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr; 
		}
		
		return getStringFromURL(url,encoding,isPost,jsonStr,"application/json");
	}

	
	public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter,
			String contentType) throws Exception {
		// TODO Auto-generated method stub
		URL apiURL = new URL(url);
		
		HttpURLConnection conn = null;
		BufferedReader br = null;
		BufferedWriter bw = null;
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			conn = (HttpURLConnection) apiURL.openConnection();
			conn.setConnectTimeout(12000);
			conn.setReadTimeout(12000);
			conn.setDoOutput(true);
			
			if(isPost) {
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Type", contentType);
				conn.setRequestProperty("Accept","*/*");
			}else {
				conn.setRequestMethod("GET");
			}
			conn.connect();
			
			if(isPost) {
				bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
				bw.write(parameter);
				bw.flush();
				bw = null;
			}
			
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),encoding));
			String line = null;
			StringBuffer result = new StringBuffer();
			
			while((line = br.readLine()) != null) result.append(line);
			
			ObjectMapper mapper = new ObjectMapper();
			
			resultMap = mapper.readValue( result.toString(), HashMap.class);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(url + " interface failed" + e.toString());
		} finally {
			if(conn != null) conn.disconnect();
			if(br != null) br.close();
			if(bw != null) bw.close();
		}
		
		return resultMap;
	}
	
	
	
	
	
	
	
	
	
	
}























