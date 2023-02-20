package org.hdcd.controller.manager.volunteer_manage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.service.manager.volunteer.MVolunteerManageService;
import org.hdcd.vo.VolunteerFileVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/volunteer/manage")
public class VolunteerManage {
	
	@Inject
	private MVolunteerManageService service;
	
	/**
	 * [관리자] 봉사관리 페이지 이동
	 * @return manager/volunteerManageList
	 */
	@GetMapping("/inVolPage")
	public String volunteerManagePage() {
		
		log.debug("volunteerManagePage 페이지로 이동합니다");
		
		return "manager/volunteerManageList";
	}
	
	
	/**
	 * [관리자] 봉사승인신청 리스트 출력 메서드
	 * @return List
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/registerList", produces = "application/json;charset=UTF-8")
	public List<Map<String, Object>> selectVolunteerList()throws Exception {
		log.debug("selectVolunteerList 시작 ~");
		
		List<Map<String, Object>> volList = service.selectRegisterList();
//		log.info("volList : "+ volList);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		for (Map<String, Object> map : volList) {
			Date volo_regidate = (Date)map.get("VOLO_REGIDATE");
			map.put("VOLO_REGIDATE", sdf.format(volo_regidate));
		}
		
		for (Map<String, Object> map : volList) {
			Date volo_start = (Date)map.get("VOLO_START");
			map.put("VOLO_START", sdf.format(volo_start));
		}
		
		for (Map<String, Object> map : volList) {
			Date volo_end = (Date)map.get("VOLO_END");
			map.put("VOLO_END", sdf.format(volo_end));
		}
		
		return volList;
	}
	
	
	/**
	 * [관리자] 개개인의 파일제출목록을 가져오는 메서드
	 * @param volo_code
	 * @return List
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/getFileInfo",produces = "application/json;charset=UTF-8")
	public List<VolunteerFileVO> selectVolunteerFileInfo(String volo_code)throws Exception{
		 
		log.debug("selectVolunteerFileInfo 시작 ~");
		log.debug("volo_code 값 확인 : {}",volo_code);

		List<VolunteerFileVO> fileList = service.selectFileList(volo_code);
		
		return fileList;
	}
	
	
	/**
	 * [관리자] 개개인의 봉사 및 개인정보를 보여주는 메서드
	 * @param volo_code
	 * @return Map
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/getDetail",produces = "application/json;charset=UTF-8")
	public Map<String, Object> selectVolunteerDetail(String volo_code)throws Exception{
		log.debug("selectVolunteerDetail 시작 ~");
		log.debug("volo_code 값 확인 : {}",volo_code);
		
		Map<String, Object> detailMap = service.selectDetail(volo_code);
		
		log.debug("detailMap 값 확인 : {}",detailMap);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
		
		Date volo_regidate = (Date)detailMap.get("VOLO_REGIDATE");
		detailMap.put("VOLO_REGIDATE", sdf1.format(volo_regidate));
		
		Date volo_start = (Date)detailMap.get("VOLO_START");
		detailMap.put("VOLO_START", sdf1.format(volo_start));
		
		Date volo_end = (Date)detailMap.get("VOLO_END");
		detailMap.put("VOLO_END", sdf1.format(volo_end));
		
		
		return detailMap;
	}

	
	/**
	 * [관리자] 승인하여 상태 업데이트 해주는 메서드
	 * @param volo_code
	 * @return String
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/updateVolState",produces = "text/plain;charset=UTF-8")
	public String updateVolunteerState(String volo_code) throws Exception{
		log.debug("updateVolunteerState 시작!");
		log.debug("코드 값 확인 : {}",volo_code);
		
		String str = "";
		
		int result = service.updateVolunteerState(volo_code);
		
		if(result > 0) {
			str += "승인이 성공적으로 완료되었습니다!";
		}else {
			str += "승인에 실패하였습니다";
		}
		return str;
	}
	
	
	/**
	 * [관리자] 반려하여 상태 업데이트 해주는 메서드
	 * @param volo_code
	 * @param volo_reject
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/updateVolDenied",produces = "text/plain;charset=UTF-8")
	public String updateVolunteerStateDenied(String volo_code,String volo_reject) throws Exception{
		log.debug("updateVolunteerState 시작!");
		log.debug("코드 값 확인 : {}",volo_code);
		log.debug("반려 값 확인 : {}",volo_reject);
		
		String str = "";
		
		int result = service.updateVolunteerDenied(volo_code,volo_reject);
		
		if(result > 0) {
			str += "반려가 성공적으로 완료되었습니다!";
		}else {
			str += "반려 처리에 실패하였습니다";
		}
		return str;
	}
	
	
	
	/**
	 * [관리자] popUp창 미리보기 기능 메서드
	 * @param fileName
	 * @return ModelAndView
	 */
	@GetMapping("/popUpImgPage")
	public ModelAndView popUpImgPage(String fileName) {
		log.debug("popUpImgPage 실행");
		log.debug("file 값 확인 : {}",fileName);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("fileName",fileName);
		mav.setViewName("volunteerPopUp");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
}










