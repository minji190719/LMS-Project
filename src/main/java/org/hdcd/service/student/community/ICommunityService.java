package org.hdcd.service.student.community;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.CommunityVO;
import org.hdcd.vo.ReplyVO;
import org.springframework.web.multipart.MultipartFile;

public interface ICommunityService {

	int registerCmntPost(HttpServletRequest request, CommunityVO communityVO, List<MultipartFile> cmntfiles) throws IllegalStateException, IOException;

	Map<String, Object> getCmntTotalList(Map<String, String> scrollNumbers);

	Map<String, Object> getCmntDetail(HttpServletRequest request, String cmnt_no);

	String registerReply(ReplyVO replyVO);

	int deleteCmnt(String cmnt_no);

	String getPrePost(String cmnt_no);

	String getNextPost(String cmnt_no);

	int updateCmnt(HttpServletRequest request, CommunityVO communityVO, List<MultipartFile> files, String[] cmntf_codes) throws IllegalStateException, IOException;

	int reportPost(Map<String, String> map);

	Map<String, Object> searchCmnt(Map<String, String> map);

	CommunityVO getCmnt(String cmnt_no);

	int deleteReplyOne(String reply_no);

	String cmntUploadSummernoteImageFile(MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException;

	Map<String, Object> getCmntPopularList();


}
