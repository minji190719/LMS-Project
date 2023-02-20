package org.hdcd.controller.common.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.notice.NoticeService;
import org.hdcd.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/notice")
public class CommonNoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main/noticeList";
	}
	
	/**
	 * (모든주체) 모든게시글 출력                  
	 * @param model
	 * @return
	 * @throws Exception
	 */
	// 리스트출력
	@ResponseBody
	@GetMapping(value = "/noticeAllList", produces = "application/json;charset=utf-8")
	public List<NoticeVO> noticeList(Model model) throws Exception{
		List<NoticeVO> getList = service.selectAllList();
		return getList;
	}
	/**
	 * 관리자 공지사항 등록
	 * @param req
	 * @param noticevo
	 * @param n_file
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/notRegister", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String noticeRegister(HttpServletRequest req, NoticeVO noticevo, List<MultipartFile> n_file)throws Exception{
		String userId = (String) req.getSession().getAttribute("userId");	
		noticevo.setMmem_no(userId);
		int insert = service.insertNotice(noticevo, n_file, req);
		
		return "등록이 완료되었습니다.";
	}
	/**
	 * 공지사항 내용조회, 수정,삭제 를 위한 번호 받아오기
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="/getNotice", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, NoticeVO> getNotice(@RequestParam int no) throws Exception {
		log.info("### 수정 폼을 들어갈때 no를 전달합니다. : " + no);
		NoticeVO noticeVO = service.getNotice(no);
		Map<String, NoticeVO> noticeMap = new HashMap<String, NoticeVO>();
		noticeMap.put("noticeMap", noticeVO);
		return noticeMap;
	}
	
	/**
	 * 공지사항 상세내용 조회
	 * @param request
	 * @param no
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @GetMapping(value = "/detail")
	public String getNoticeDetail(HttpServletRequest request, int no, Model model) throws Exception {
		log.debug(">>>>>> getNoticeDetail");
		  String userId = (String) request.getSession().getAttribute("userId");
		  Map<String, Object> noticeMap = service.noticeView(no);
		  model.addAttribute("noticeMap", noticeMap); 
		  model.addAttribute("userId",userId);
		return "main/noticeDetail";	
	}
  
	  /**
	   * (관리자)위의 getnotice 로 번호를 받아 공지사항 수정
	   * @param req
	   * @param vo
	   * @param mn_file
	   * @return
	   * @throws Exception
	   */
	  //공지사항 수정
	  @PostMapping(value = "/modinotice", produces = "text/plain;charset=UTF-8")
	  @ResponseBody 
	  public String noticeModify(HttpServletRequest req, NoticeVO vo, List<MultipartFile> mn_file) throws Exception { 
	  String userId = (String) req.getSession().getAttribute("userId");	
	  vo.setMmem_no(userId);
	  int insert = service.modifyNotice(vo, mn_file, req);
	  return "SUCCESS";
	  }
	 
	  /**
	   * (관리자)위의 getnotice로 번호를 받아 공지사항 삭제
	   * @param notice_no
	   * @param req
	   * @return
	   * @throws Exception
	   */
	  @GetMapping(value = "/deletenotice", produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	  public String deleteNotice(int notice_no,HttpServletRequest req)throws Exception{
		  String userId = (String) req.getSession().getAttribute("userId");	
		  service.deleteNotice(notice_no);
		  return "성공";
	  }
	  
	  /**
	   * 카테고리별 공지사항 조회
	   * @param category
	   * @param req
	   * @return
	   * @throws Exception
	   */
	  @GetMapping(value = "/selectCategory", produces = "application/json;charset=utf-8")
	  @ResponseBody
	  public List<NoticeVO> selectCategory(String category, HttpServletRequest req)throws Exception{
		  String userId = (String) req.getSession().getAttribute("userId");
		  List<NoticeVO> cateList = service.selectCategory(category);
		  return cateList;
	  }
	  /**
	   * 가장 최근에 작성된 공지사항 5개 출력
	   * @param model
	   * @return
	   * @throws Exception
	   */
		@ResponseBody
		@GetMapping(value = "/noticefive", produces = "application/json;charset=utf-8")
		public List<NoticeVO> noticefive(Model model) throws Exception{
			List<NoticeVO> getfiveList = service.noticeFive();
			return getfiveList;
		}
	  
	  
	  
}
