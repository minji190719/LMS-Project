package org.hdcd.service.common.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.BoardVO;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	List<BoardVO> selectAllList(String dep_code) throws Exception;
	
	//교수 인서트
	int insertBoard(BoardVO BoardVo, List<MultipartFile> board_files,HttpServletRequest req)throws Exception;
	
	// 게시글삭제
	public int deleteBoard(int no)throws Exception;

	//게시글 번호받아오기
	public BoardVO getBoard(int no) throws Exception;

	//게시글 수정
	int modifyBoard(BoardVO vo, List<MultipartFile> c_file, HttpServletRequest req) throws Exception;
	
	//게시글 번호 받아오기
	Map<String,Object> getBoardNo(int no) throws Exception;
	
	//게시글 상세정보 조회
	Map<String, Object> BoardView(int no)throws Exception;
	
	// 학과별 게시판 정보 
	List<Map<String, Object>> Allinfo(String dep_code)throws Exception;
}
