package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.BoardFileVO;
import org.hdcd.vo.BoardVO;

@Mapper
public interface BoardMapper {
	List<BoardVO> selectAllList(String dep_code) throws Exception;
	
	//교수 인서트
	int insertBoard(BoardVO BoardVo)throws Exception;
	int insertBFiles(BoardFileVO boardfileVo);	
	
	// 삭제
	public int deleteBoard(int no)throws Exception;
	
	// 수정
	public int modifyBoard(BoardVO vo)throws Exception;
	public int modifyBoardFile(BoardFileVO boardfileVo)throws Exception;
	
	// 게시글 번호 받아오기
	public BoardVO getBoardNo(int no)throws Exception;
	//게시글번호 맵으로 받아오기
	Map<String,Object> getBoard_No(int no) throws Exception;
	
	// 게시글 상세정보
	Map<String, Object> BoardView(int no)throws Exception;
	List<BoardFileVO> bofileList(int no)throws Exception;
	
	// 학과별 게시판 게시글 받아오기
	List<Map<String, Object>> Allinfo(String dep_code)throws Exception;
	
	//조회수증가
	public void incrementHit(int no);
}
