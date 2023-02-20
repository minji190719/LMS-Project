package org.hdcd.service.student.community;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.CommunityLikeVO;
import org.hdcd.vo.CommunityVO;

public interface IMyCommunityService {

	List<CommunityVO> getMyPost(String smem_no);

	List<Map<String, Object>> getMyReply(String smem_no);

	List<CommunityVO> getMyLike(String smem_no);

	String insertCmntLike(CommunityLikeVO cmntLikeVO);

	int deleteCmntLike(CommunityLikeVO cmntLikeVO);

	int getMyPostCnt(String smem_no);

	int getMyReplyCnt(String smem_no);

	int getMyLikeCnt(String smem_no);

	int minusCmntLike(String cmnt_no);

	int deleteCmntLikeByVO(CommunityLikeVO cmntLikeVO);

}
