package org.hdcd.controller.student.attendApply;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.service.student.attendApply.IAttendApplyService;
import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendProveVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attend")
public class AttendApplyController {
	
	@Inject
	private IAttendApplyService service;
	
	@GetMapping(value = "/attendApplyPage")
	public String attendApplyPage(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> absentList = service.selectMyAbsentList(userId);
		
		model.addAttribute("list", absentList);
		
		return "student/attendApply";
	}
	
	@ResponseBody
	@PostMapping(value = "/attendApplyRegister")
	public String attendApplyRegister(HttpServletRequest request, AttendApplyVO attendApplyVO) throws Exception {
		
		log.debug("attendApplyVO 찍어보기 : " + attendApplyVO);
		
		int cntAA = service.insertAttendApply(attendApplyVO);
		
		log.debug("aaCode : "+ attendApplyVO.getAa_code());
		
		AttendProveVO attendProveVO = new AttendProveVO();
		attendProveVO.setAa_code(attendApplyVO.getAa_code());
		
		MultipartFile file = attendApplyVO.getApplyfile();
		
		// file_size
		int fileSize = (int) file.getSize();
		
		// file_typ
		String fileType = file.getContentType();
		
		// file_originnm
		String originalFileName = file.getOriginalFilename();
		
		ServletContext servletContext = request.getSession().getServletContext();
		
		String realPath = servletContext.getRealPath("/resources/attendFile");
		
		String uuid = UUID.randomUUID().toString();
		
		// file_name
		String saveFileName = uuid + "_" + originalFileName;
		
		// file_path
		String filePath = servletContext.getContextPath() + "/resources/attendFile/" + saveFileName;
		
		log.debug("fileSize : " + fileSize);
		log.debug("fileType : " + fileType);
		log.debug("originalFileName : " + originalFileName);
		log.debug("saveFileName : " + saveFileName);
		log.debug("filePath : " + filePath);

		attendProveVO.setFile_size(fileSize);
		attendProveVO.setFile_typ(fileType);
		attendProveVO.setFile_originnm(originalFileName);
		attendProveVO.setFile_name(saveFileName);
		attendProveVO.setFile_path(filePath);
		
		int cntAP = service.insertAttendProve(attendProveVO);
		
		File dir = new File(realPath);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		File attendApplyFile = new File(realPath + "/" + saveFileName);
		
		file.transferTo(attendApplyFile);
		
		if(cntAA > 0 && cntAP > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
	@ResponseBody
	@GetMapping(value = "/getMyAttendApplyList", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> getMyAttendApplyList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Map<String, Object>> attendAppList = service.selectMyAttendApplyList(userId);
		
		log.debug("attendAppList뽑기 : " + attendAppList);
		
		return attendAppList;
	}
	
	@ResponseBody
	@PostMapping(value = "/deleteAttendApply")
	public String deleteAttendApply(@RequestBody Map<String, String> map) throws Exception {
		String aaCode = map.get("aaCode");
		
		log.debug("aaCode 찍기 : "+ aaCode);
		
		int cnt = service.deleteAttendApply(aaCode);

		
		if(cnt > 0) {
			return "OK";
		}
		
		return "NG";
	}
}
