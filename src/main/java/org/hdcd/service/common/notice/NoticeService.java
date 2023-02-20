package org.hdcd.service.common.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.NoticeFileVO;
import org.hdcd.vo.NoticeVO;
import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {
	
	
	// 학생 교수 관리자 모두 공통
	List<NoticeVO> selectAllList() throws Exception;
	
	//관리자 인서트
	int insertNotice(NoticeVO noticeVo, List<MultipartFile> notice_files,HttpServletRequest req)throws Exception;
	
	// 삭제
	public int deleteNotice(int no)throws Exception;
	
	// 공지사항 번호 받아오기
	public NoticeVO getNotice(int no) throws Exception;

	// 공지사항 수정
	int modifyNotice(NoticeVO vo, List<MultipartFile> mn_file, HttpServletRequest req) throws Exception;
	// 상세정보 출력하기
	Map<String, Object> noticeView(int no)throws Exception;
	
	List<NoticeVO> selectCategory(String category)throws Exception;
	
	List<NoticeVO> noticeFive()throws Exception;
	
}
