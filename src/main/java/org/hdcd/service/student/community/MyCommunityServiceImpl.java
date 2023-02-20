package org.hdcd.service.student.community;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.CommunityMapper;
import org.hdcd.vo.CommunityLikeVO;
import org.hdcd.vo.CommunityVO;
import org.springframework.stereotype.Service;

@Service
public class MyCommunityServiceImpl implements IMyCommunityService{

	@Inject
	CommunityMapper mapper;
	
	@Override
	public List<CommunityVO> getMyPost(String smem_no) {
		return mapper.getMyPost(smem_no);
	}

	@Override
	public List<Map<String, Object>> getMyReply(String smem_no) {
		return mapper.getMyReply(smem_no);
	}

	@Override
	public List<CommunityVO> getMyLike(String smem_no) {
		return mapper.getMyLike(smem_no);
	}

	// LIKE 이력이 없는 경우
	@Override
	public String insertCmntLike(CommunityLikeVO cmntLikeVO) {
		mapper.plusCmntLike(cmntLikeVO.getCmnt_no());
		mapper.insertCmntLike(cmntLikeVO);
		String like_code = cmntLikeVO.getLike_code();
		return like_code;
	}

	// LIKE 이력이 있는 경우
	@Override
	public int deleteCmntLike(CommunityLikeVO cmntLikeVO) {
		mapper.minusCmntLike(cmntLikeVO.getCmnt_no());
		return mapper.deleteCmntLike(cmntLikeVO);
	}

	@Override
	public int getMyPostCnt(String smem_no) {
		return mapper.getMyPostCnt(smem_no);
	}

	@Override
	public int getMyReplyCnt(String smem_no) {
		return mapper.getMyReplyCnt(smem_no);
	}

	@Override
	public int getMyLikeCnt(String smem_no) {
		return mapper.getMyLikeCnt(smem_no);
	}

	@Override
	public int minusCmntLike(String cmnt_no) {
		return mapper.minusCmntLike(cmnt_no);
	}

	@Override
	public int deleteCmntLikeByVO(CommunityLikeVO cmntLikeVO) {
		return mapper.deleteCmntLikeByVO(cmntLikeVO);
	}

}
