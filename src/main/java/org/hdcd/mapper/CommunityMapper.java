package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.CommunityFileVO;
import org.hdcd.vo.CommunityLikeVO;
import org.hdcd.vo.CommunityVO;
import org.hdcd.vo.ReplyVO;

@Mapper
public interface CommunityMapper {
	// ■■■■■■■■■■■■■■■■ 학생 ■■■■■■■■■■■■■■■■■■■■
	
	int registerCmntPost(CommunityVO communityVO);

	int registerCmntPostFile(CommunityFileVO cmntfile);

	CommunityVO getCmntDetail(String cmnt_no);

	List<CommunityVO> getCmntTotalList(Map<String, String> scrollNumbers);

	CommunityFileVO getCmntFileTotalList(String cmnt_no);

	int countReply(String cmnt_no);
	
	int plusCmntHits(CommunityVO comnVO);

	CommunityVO getCmnt(String cmnt_no);

	List<CommunityFileVO> getCmntFile(String cmnt_no);

	List<ReplyVO> getCmntReply(String cmnt_no);

	int registerReply(ReplyVO replyVO);

	int deleteCmntFile(String cmnt_no);

	int deleteReply(String cmnt_no);
	
	int deleteCmntLikeByCmntNo(String cmnt_no);

	int deleteCmnt(String cmnt_no);

	int deleteCmntSavedFile(Map<String, Object> map);

	String getPrePost(String cmnt_no);

	String getNextPost(String cmnt_no);

	int updateCmnt(CommunityVO communityVO);

	int updateCmntPostFile(CommunityFileVO cmntfile);

	int reportPost(Map<String, String> map);

	List<CommunityVO> searchCmnt(Map<String, String> map);

	int deleteReplyOne(String reply_no);
	
	// 나의 커뮤니티
	List<CommunityVO> getMyPost(String smem_no);

	List<Map<String, Object>> getMyReply(String smem_no);

	List<CommunityVO> getMyLike(String smem_no);

	String checkCmntLike(CommunityLikeVO communityLikeVO);

	int insertCmntLike(CommunityLikeVO cmntLikeVO);

	int deleteCmntLike(CommunityLikeVO cmntLikeVO);

	int plusCmntLike(String cmnt_no);

	int minusCmntLike(String cmnt_no);

	int getMyPostCnt(String smem_no);

	int getMyReplyCnt(String smem_no);

	int getMyLikeCnt(String smem_no);
	
	List<CommunityVO> getCmntPopularList();

	int deleteCmntLikeByVO(CommunityLikeVO cmntLikeVO);

	// ■■■■■■■■■■■■■■■■ 관리자 ■■■■■■■■■■■■■■■■■■■■

	List<CommunityVO> getUnhandledList();

	List<CommunityVO> getDisposedList();

	List<CommunityVO> getReturnedList();

	int cmntDisposed(String cmnt_no);

	int cmntReturned(String cmnt_no);

	int countUnhandled();

	int countDisposed();

	int countReturned();

	String getCommuUser(String string);







	
	

}
