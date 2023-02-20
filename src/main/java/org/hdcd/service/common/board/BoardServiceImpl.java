package org.hdcd.service.common.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.BoardMapper;
import org.hdcd.vo.BoardFileVO;
import org.hdcd.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;

	
	@Override
	public List<BoardVO> selectAllList(String dep_code) throws Exception {
		return mapper.selectAllList(dep_code);
	}
	
	// 게시글 등록시 파일처리
	@Override
	public int insertBoard(BoardVO BoardVo, List<MultipartFile> board_files, HttpServletRequest req) throws Exception {
		
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		
		BoardFileVO FBoardVO = new BoardFileVO();
		
		int res = mapper.insertBoard(BoardVo);
		
		
		
		for (int i = 1; i < board_files.size(); i++) {
			
			String saveFName = uuid + "_" + board_files.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			FBoardVO.setFile_size(board_files.get(i).getSize());
			FBoardVO.setFile_originnm(board_files.get(i).getOriginalFilename());
			FBoardVO.setFile_name(saveFName);
			FBoardVO.setFile_path(filePath);
			FBoardVO.setBoard_no(BoardVo.getBoard_no());
			FBoardVO.setFile_type(board_files.get(i).getContentType());
			int cnt = mapper.insertBFiles(FBoardVO);
			board_files.get(i).transferTo(new File(realpath + "/" + saveFName));
			
			
		}
		return 0;
	}
	
	//게시글 삭제
	@Override
	public int deleteBoard(int no) throws Exception {
		return mapper.deleteBoard(no);
	}

	//게시글 번호 받아오기
	@Override
	public BoardVO getBoard(int no) throws Exception {
		return mapper.getBoardNo(no);
	}

	//게시글 수정시 파일처리
	@Override
	public int modifyBoard(BoardVO vo, List<MultipartFile> c_file, HttpServletRequest req) throws Exception {
		
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		
		BoardFileVO ufileVO = new BoardFileVO();
		
		int res = mapper.modifyBoard(vo);
		
		for (int i = 0; i < c_file.size(); i++) {
			
			String saveFName = uuid + "_" + c_file.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			ufileVO.setFile_size(c_file.get(i).getSize());
			ufileVO.setFile_originnm(c_file.get(i).getOriginalFilename());
			ufileVO.setFile_name(saveFName);
			ufileVO.setFile_path(filePath);
			ufileVO.setBoard_no(vo.getBoard_no());
			ufileVO.setFile_type(c_file.get(i).getContentType());
			
			int cnt = mapper.modifyBoardFile(ufileVO);
			
			c_file.get(i).transferTo(new File(realpath + "/" + saveFName));
			
			
		}
		return 0;
	}

	// 게시글 상세정보 
	@Override
	public Map<String, Object> BoardView(int no) throws Exception {
		mapper.incrementHit(no);
		Map<String,Object> boardmap2 = mapper.getBoard_No(no);
		List<BoardFileVO> boardFileVO = mapper.bofileList(no);
		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("boardVO", boardmap2);
		boardMap.put("boardFileVO", boardFileVO);
		return boardMap;
	}


	// 게시글 전부 받아오기 
	@Override
	public List<Map<String,Object>> Allinfo(String dep_code) throws Exception {
		return mapper.Allinfo(dep_code);
	}


	public Map<String, Object> getBoardNo(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	

}
