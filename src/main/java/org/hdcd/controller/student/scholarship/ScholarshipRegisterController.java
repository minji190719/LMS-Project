package org.hdcd.controller.student.scholarship;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.scholar.IScholarService;
import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scholar")
public class ScholarshipRegisterController {
	
	@Inject
	private IScholarService service;
	
	// ▶[학생] 장학금 종류 전체 리스트 select
	@GetMapping
	public String scholarApplyForm(Model model) {
		log.info("▶scholarApplyForm");
		List<ScholarListVO> scholarListVO = service.getScholarList();	
		log.info("scholarListVO {}", scholarListVO.toString());
		model.addAttribute("scholarListVO", scholarListVO);
		return "student/scholarApplyForm";
	}
	
	// ▶[학생] 개별 장학금 신청 내역 출력 리스트 select
	@ResponseBody
	@GetMapping(value="/getList", produces = "application/json;charset=utf-8")
	public List<ScholarApplyVO> getScholarApplyList(HttpServletRequest request)  throws Exception{
		log.info("▶getScholarApplyList");
		String userId = (String) request.getSession().getAttribute("userId");
		List<ScholarApplyVO> scholarApplyList = service.getScholarApplyList(userId);
		log.info("scholarApplyList: {}", scholarApplyList.toString());
		return scholarApplyList;
	}
	
	// ▶[학생] 장학금 신청폼 insert 후, 성공할 경우 폼에 딸린 장학증빙서류도 insert 
	@ResponseBody
	@PostMapping(value="/apply", produces = "text/plain;charset=UTF-8")
	public String scholarApply(HttpServletRequest request, ScholarApplyVO scholarApplyVO) throws IllegalStateException, IOException {
		log.info("▶scholarApply");
		log.info("scholarApplyVO의 toString: {}", scholarApplyVO.toString()); // 파일 잘 들어옴.
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resources/uploads");
		log.info("realPath: {}", realPath);
		int fileSize = scholarApplyVO.getSchaFiles().size();
		int fileCnt = service.insertScholarApply(request, scholarApplyVO);
		
		
		if(fileCnt == fileSize) { // 학생이 전송한 파일 개수와 DB에 insert된 파일개수가 동일할 때
			return "성공적으로 등록되었습니다.";
		}else {
			return "등록에 실패했습니다. 다시 시도해주십시오.";
		}
	}
	
	@ResponseBody
	@GetMapping(value = "/delete/{scha_no}", produces = "text/plain;charset=UTF-8")
	public String scholarApplyDelete(@PathVariable String scha_no) {
		log.info("▶scholarApplyDelete");
		log.info("들어온 값 {} ", scha_no);
		int cnt = service.scholarApplyDelete(scha_no);
		
		if(cnt > 0) {
			return "성공적으로 삭제되었습니다.";
		}else {
			return "삭제에 실패했습니다. 다시 시도해주십시오.";
		}
	}	
}
