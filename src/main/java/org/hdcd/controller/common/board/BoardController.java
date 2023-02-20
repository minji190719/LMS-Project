package org.hdcd.controller.common.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.board.BoardService;
import org.hdcd.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		log.debug("▶main");
		return "main/university";
	}
	/**
	 * (모든주체)각 학과로 이동하기위한 depcode받아오기
	 * @param dep_code
	 * @param model, 
	 * @return boardAllList
	 * @throws Exception
	 */
	@RequestMapping(value = "/commain", method = RequestMethod.GET)
	public String commain(String dep_code, Model model) throws Exception {
		 List<Map<String,Object>> allinfomap = service.Allinfo(dep_code);
		 
		  model.addAttribute("allinfomap",allinfomap);
		  model.addAttribute("dep_code",dep_code);
		return "main/boardList";
	}
	/**
	 * (모든주체)각과의 게시물 출력 
	 * @param dep_code
	 * @param model
	 * @return common/comdetail
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/boardAllList", produces = "application/json;charset=utf-8")
	public List<BoardVO> boardList(String dep_code,Model model) throws Exception{
		List<BoardVO> getList = service.selectAllList(dep_code);
		return getList;
	}
	  /**
	   * (교수)게시글 등록, 게시글은 각과 교수들만 등록가능
	   * @param req, boardvo, c_file
	   * @return boardAllList
	   * @throws Exception
	   */
	  @PostMapping(value = "/boardRegister", produces = "text/plain;charset=UTF-8")
	  @ResponseBody
		public String boardRegister(HttpServletRequest req, BoardVO boardvo, List<MultipartFile> c_file)throws Exception{
			String userId = (String) req.getSession().getAttribute("userId");
			boardvo.setPmem_no(userId);
			int insert = service.insertBoard(boardvo, c_file, req);
			return "등록이 완료되었습니다.";
		}
	  /**
	   * (모든주체)게시글내용,수정,삭제 를 위한 각 게시글 번호 받아오기
	   * @param no
	   * @return
	   * @throws Exception
	   */
	  @GetMapping(value="/getBoard", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, BoardVO> getBoard(@RequestParam int no) throws Exception {
			log.info("### 수정 폼을 들어갈때 no를 전달합니다. : " + no);
			BoardVO boardVO = service.getBoard(no);
			Map<String, BoardVO> boardMap = new HashMap<String, BoardVO>();
			boardMap.put("boardMap", boardVO);
			return boardMap;
		}
	  
	  /**
	   * (모든주체)각 학과별 게시판
	   * @param request
	   * @param no
	   * @param model
	   * @return main/comdetail
	   * @throws Exception
	   */
	  
	  @GetMapping(value = "/detail")
		public String getBoardDetail(HttpServletRequest request, int no, Model model) throws Exception {
			  String userId = (String) request.getSession().getAttribute("userId");
			  Map<String, Object> boardMap = service.BoardView(no);
			  model.addAttribute("BoardeMap", boardMap); 
			  model.addAttribute("userId",userId);
			return "main/comdetail";	
		}
	  
	  /**
	   * (교수)위의 getboard로 해당게시글의 번호를 받아 게시글 수정
	   * @param req
	   * @param vo
	   * @param c_file
	   * @return
	   * @throws Exception
	   */
	  @PostMapping(value = "/modiboard", produces = "text/plain;charset=UTF-8")
	  @ResponseBody 
	  public String boardModify(HttpServletRequest req, BoardVO vo, List<MultipartFile> c_file) throws Exception { 
	  String userId = (String) req.getSession().getAttribute("userId");	
	  vo.setPmem_no(userId);
	  int insert = service.modifyBoard(vo, c_file, req);
	  return "SUCCESS";
	  }
	  
	  /**
	   * (교수)위의 getboard로 해당게시글의 번호를 받아 게시글 삭제
	   * @param board_no
	   * @param req
	   * @return
	   * @throws Exception
	   */
	  @GetMapping(value = "/deleteboard", produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	  public String deleteBoard(int board_no,HttpServletRequest req)throws Exception{
		  String userId = (String) req.getSession().getAttribute("userId");	
		  service.deleteBoard(board_no);
		  return "성공";
	  }
	  
}
