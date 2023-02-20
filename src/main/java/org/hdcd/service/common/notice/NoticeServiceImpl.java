package org.hdcd.service.common.notice;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.NoticeMapper;
import org.hdcd.vo.CommunityFileVO;
import org.hdcd.vo.CommunityVO;
import org.hdcd.vo.NoticeFileVO;
import org.hdcd.vo.NoticeVO;
import org.hdcd.vo.ReplyVO;
import org.hdcd.vo.VolunteerFileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> selectAllList() throws Exception {
		return mapper.selectAllList();
	}

	// 공지사항 등록시 파일 처리
	@Override
	public int insertNotice(NoticeVO noticeVo, List<MultipartFile> n_file, HttpServletRequest req)
			throws Exception {
		
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		
		NoticeFileVO fileVO = new NoticeFileVO();
		
		int res = mapper.insertNotice(noticeVo);
		
		
		
		for (int i = 1; i < n_file.size(); i++) {
			
			String saveFName = uuid + "_" + n_file.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			fileVO.setFile_size(n_file.get(i).getSize());
			fileVO.setFile_originnm(n_file.get(i).getOriginalFilename());
			fileVO.setFile_name(saveFName);
			fileVO.setFile_path(filePath);
			fileVO.setNotice_no(noticeVo.getNotice_no());
			fileVO.setFile_type(n_file.get(i).getContentType());
			
			int cnt = mapper.insertFiles(fileVO);
			n_file.get(i).transferTo(new File(realpath + "/" + saveFName));
			
		}
		return 0;
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(int no) throws Exception {
		return mapper.deleteNotice(no);
	}
	
	// 공지사항 수정시 파일처리
	@Override
	public int modifyNotice(NoticeVO vo,List<MultipartFile> mn_file, HttpServletRequest req) throws Exception {
	
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		
		NoticeFileVO ufileVO = new NoticeFileVO();
		
		int res = mapper.modifyNotice(vo);
		
		
		for (int i = 0; i < mn_file.size(); i++) {
			
			String saveFName = uuid + "_" + mn_file.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			ufileVO.setFile_size(mn_file.get(i).getSize());
			ufileVO.setFile_originnm(mn_file.get(i).getOriginalFilename());
			ufileVO.setFile_name(saveFName);
			ufileVO.setFile_path(filePath);
			ufileVO.setNotice_no(vo.getNotice_no());
			ufileVO.setFile_type(mn_file.get(i).getContentType());
			
			int cnt = mapper.modifyNoticeFile(ufileVO);
			
			mn_file.get(i).transferTo(new File(realpath + "/" + saveFName));
			
			
		}
		
		return 0;
	}
	
	//공지사항 번호받아오기
	@Override
	public NoticeVO getNotice(int no) throws Exception {
		return mapper.getNotice(no);
	}
	
	// 공지사항 상세정보
	@Override
	public Map<String, Object> noticeView(int no) throws Exception {
		mapper.incrementHit(no);
		NoticeVO noticeVO = mapper.getNotice(no);
		List<NoticeFileVO> noticeFileVO = mapper.nofileList(no);
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("noticeVO", noticeVO);
		noticeMap.put("noticeFileVO", noticeFileVO);
		return noticeMap;
	}

	@Override
	public List<NoticeVO> selectCategory(String category) throws Exception {
		return mapper.selectCategory(category);
	}

	@Override
	public List<NoticeVO> noticeFive() throws Exception {
		return mapper.noticeFive();
	}

}
