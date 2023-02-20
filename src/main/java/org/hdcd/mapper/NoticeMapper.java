package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.NoticeFileVO;
import org.hdcd.vo.NoticeVO;
import org.hdcd.vo.VolunteerFileVO;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface NoticeMapper {
	List<NoticeVO> selectAllList()throws Exception;
	
	// 관리자용 인서트 메소드
	int insertNotice(NoticeVO noticeVo)throws Exception;
	int insertFiles(NoticeFileVO noticefileVo);
	
	// 삭제
	public int deleteNotice(int no)throws Exception;
	
	// 수정
	public int modifyNotice(NoticeVO vo)throws Exception;
	public int modifyNoticeFile(NoticeFileVO filevo)throws Exception;
	
	// 공지사항 번호 받아오기
	public NoticeVO getNotice(int no)throws Exception;
	
	// 상세정보
	Map<String, Object> noticeView(int no)throws Exception;
	List<NoticeFileVO> nofileList(int no)throws Exception;
	
	// 조회수증가
	public void incrementHit(int no);
	
	List<NoticeVO> selectCategory(String category)throws Exception;
	
	List<NoticeVO> noticeFive()throws Exception;
	
}
