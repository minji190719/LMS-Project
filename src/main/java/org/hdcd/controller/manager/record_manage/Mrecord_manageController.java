package org.hdcd.controller.manager.record_manage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.manager.record.MrecordmanageService;
import org.hdcd.vo.RecordApplyListVO;
import org.hdcd.vo.RecordApplyVO;
import org.hdcd.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
@RequestMapping("/recordapproval")
public class Mrecord_manageController {
	
	@Autowired
	MrecordmanageService service;
	
	@RequestMapping(value = "/Mrecordmain", method = RequestMethod.GET)
	public String Mrecordapplymain() {
		return "manager/mRecordApplyManage";
	}
	
	//학생들의 전체 신청 리스트
	@GetMapping(value = "/SapplyAllList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<RecordApplyListVO> recordapplylist(HttpServletRequest req) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		List<RecordApplyListVO> srecordList = service.selectAllList();
		return srecordList;
	}
	// 신청한 사람들 번호를 받아 신청한 학생의 상세정보 조회
	@GetMapping(value = "/SapplyNoList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Map<String,Object>> recordappNoList(HttpServletRequest req, String memId, String rcrda_reason) throws Exception{
		String smem_no = (String) req.getSession().getAttribute("userId");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		// 학번이랑 신청구분을 받아서 그걸로 쿼리문 실행
		dataMap.put("mem_no", memId);
		dataMap.put("rcrda_reason", rcrda_reason);
		List<Map<String,Object>> dataList = service.selectsNo(dataMap);
		for (Map<String, Object> map : dataList) {
			Date rcrda_date = (Date)map.get("RCRDA_DATE");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			map.put("RCRDA_DATE", sdf.format(rcrda_date));
		}
		for(Map<String,Object> dataKey : dataList) {
			dataKey.remove("MEM_PHOTONM");
		}
		return dataList;
	}
	
	@PostMapping(value = "/upadteRecord")
	@ResponseBody
	public String recordupdate(HttpServletRequest req, RecordApplyVO recordapplyVo) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		int res = service.updateRecord(recordapplyVo);
		int code = recordapplyVo.getRcrda_record();
		return "SUCCESS";
	}
	@PostMapping(value = "/validationRecord")
	@ResponseBody
	public String recordValidation(HttpServletRequest req, RecordApplyVO recordapplyVo, String smem_no)throws Exception {
		int res = service.validationRecord(recordapplyVo);
		int stu = service.updateStudent(smem_no);
		log.info("이것은 student --> " + stu);
		return "SUCCESS";
	}
}