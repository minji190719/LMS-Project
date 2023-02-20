package org.hdcd.service.student.community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.CommunityMapper;
import org.hdcd.vo.CommunityFileVO;
import org.hdcd.vo.CommunityLikeVO;
import org.hdcd.vo.CommunityVO;
import org.hdcd.vo.ReplyVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommunityServiceImpl implements ICommunityService{

	@Inject
	CommunityMapper mapper;
	
	@Override
	public int registerCmntPost(HttpServletRequest request, CommunityVO communityVO, List<MultipartFile> cmntfiles) throws IllegalStateException, IOException {
		// userId 및 제목 세팅
		String userId = (String) request.getSession().getAttribute("userId");
		log.debug("내 아이디는 " + userId);
		communityVO.setSmem_no(userId);
		communityVO.setCmnt_content(communityVO.getCmnt_content().replaceAll("\r\n","<br>"));
		log.debug("vo : " + communityVO.toString());
		// 커뮤니티 게시글 등록 후, selectKey로 게시글 번호를 가져온다.
		int cnt = mapper.registerCmntPost(communityVO);
		System.out.println("나의 넘버는" + communityVO.getCmnt_no()); //13, 앞에 cmnt 붙여줘야 함.
		String cmnt_no = "CMNT" + communityVO.getCmnt_no();
		log.debug("나의 cmnt_no는 " + cmnt_no);
		log.debug("communityVO는" + communityVO.toString());
		
		// 게시글 등록에 성공했을 경우, 첨부파일도 추가 등록한다.
		if(cnt > 0 || cmntfiles.size() != 0 ) {
			
			ServletContext sc = request.getSession().getServletContext();
			String realPath = sc.getRealPath("/resources/uploads"); // 이클립스 가상 주소
			
			for (MultipartFile file : cmntfiles) {
				if(file.getOriginalFilename() != null) {					
					UUID uuid = UUID.randomUUID();
					long file_size = file.getSize();				
					// file_name, file_originnm, file_size, file_path, file_type
					String file_name = uuid + file.getOriginalFilename();
					String file_originnm = file.getOriginalFilename();
					String file_path = "/resources/uploads/" + file_name;
					String file_type = file.getContentType();
					
					log.debug("fileName:" + file_originnm);
					
					if(file_type.equals("application/octet-stream")) {
						log.debug("난 등록 안하고 돌아갈게");
					}else {
						log.debug("난 등록 할게");
						CommunityFileVO cmntfile = new CommunityFileVO(cmnt_no, file_name, file_originnm, file_size, file_path, file_type);
						
						cnt = mapper.registerCmntPostFile(cmntfile);
						
						// 첨부파일 정보가 db에 등록된 경우, 파일을 transfer
						file.transferTo(new File(realPath + "/" + file_name));				
					}
				}
			}
		}
		return cnt;
	}

	@Override
	public Map<String, Object> getCmntTotalList(Map<String, String> scrollNumbers) {
		List<CommunityVO> cmntList = mapper.getCmntTotalList(scrollNumbers);
		List<CommunityFileVO> cmntFileList = new ArrayList<CommunityFileVO>();
		for (CommunityVO communityVO : cmntList) {
			String cmnt_no = communityVO.getCmnt_no();
			int replyCount = mapper.countReply(cmnt_no);
			communityVO.setReply_count(replyCount); // 게시글별 달린 댓글 개수를 저장한다.
			
			CommunityFileVO communityFileVO = mapper.getCmntFileTotalList(cmnt_no); // cmnt에 해당하는 파일리스트만 가져온다.
			cmntFileList.add(communityFileVO);
		}
		
		
		Map<String, Object> cmntTotalMap = new HashMap<String, Object>();
		cmntTotalMap.put("cmntList", cmntList);
		cmntTotalMap.put("cmntFileList", cmntFileList);
		return cmntTotalMap;
	}

	@Override
	public Map<String, Object> getCmntDetail(HttpServletRequest request, String cmnt_no) {
		String smem_no = (String) request.getSession().getAttribute("userId");
		CommunityVO comnVO = new CommunityVO();
		comnVO.setSmem_no(smem_no);
		comnVO.setCmnt_no(cmnt_no);
		
		int cnt = mapper.plusCmntHits(comnVO); // userId와 커뮤니티의 글 작성자가 같지 않을 경우, 조회수를 증가시킨다.
		
		CommunityVO communityVO = mapper.getCmnt(cmnt_no);
		
		int replyCount = mapper.countReply(cmnt_no);
		communityVO.setReply_count(replyCount);
		
		List<CommunityFileVO> communityFileVOList = mapper.getCmntFile(cmnt_no);
		List<ReplyVO> replyVOList = mapper.getCmntReply(cmnt_no);
		
		CommunityLikeVO communityLikeVO = new CommunityLikeVO();
		communityLikeVO.setCmnt_no(cmnt_no);
		communityLikeVO.setSmem_no(smem_no);
		String like_code = mapper.checkCmntLike(communityLikeVO);
	
		Map<String, Object> communityMap = new HashMap<String, Object>();
		communityMap.put("cmntVO", communityVO);
		communityMap.put("cmntFileVOList", communityFileVOList);
		communityMap.put("replyVOList", replyVOList);
		communityMap.put("like_code", like_code);
		
		return communityMap;
	}

	@Override
	public String registerReply(ReplyVO replyVO) {
		int cnt = mapper.registerReply(replyVO);
		String reply_no = replyVO.getReply_no();
		return reply_no;
	}

	@Override
	public int deleteCmnt(String cmnt_no) {
		int fileCnt = 0;	
		int replyCnt = 0;
		int cLikeCnt = 0;
		int cmntCnt = 0;
		
		fileCnt = mapper.deleteCmntFile(cmnt_no); // 딸린 파일 먼저 삭제		
		replyCnt = mapper.deleteReply(cmnt_no); // 딸린 댓글 먼저 삭제
		cLikeCnt = mapper.deleteCmntLikeByCmntNo(cmnt_no); // 딸린 좋아요 먼저 삭제
		cmntCnt = mapper.deleteCmnt(cmnt_no); // 커뮤니티 게시글 원본 삭제				
		return cmntCnt;
	}

	@Override
	public String getPrePost(String cmnt_no) {
		String no = mapper.getPrePost(cmnt_no);
		log.debug("toString:" + no);
		return no;
	}
	
	@Override
	public String getNextPost(String cmnt_no) {
		String no = mapper.getNextPost(cmnt_no);
		log.debug("toString:" + no);
		return no;
	}

	@Override
	public int updateCmnt(HttpServletRequest request, CommunityVO communityVO, List<MultipartFile> cmntfiles, String[] cmntf_codes) throws IllegalStateException, IOException {
		String cmnt_no = communityVO.getCmnt_no();
		communityVO.setCmnt_content(communityVO.getCmnt_content().replaceAll("\r\n","<br>"));
		int cnt = mapper.updateCmnt(communityVO);
		log.debug("글 수정 성공 여부 = " + cnt);
		
		cnt = 0;
		
		if(cmntf_codes == null) {			
			cnt = mapper.deleteCmntFile(cmnt_no);
		}else if(cmntf_codes.length == 0){
			cnt = mapper.deleteCmntFile(cmnt_no);
		}else{		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cmnt_no", cmnt_no);
			map.put("cmntf_codes", cmntf_codes);
			cnt = mapper.deleteCmntSavedFile(map);
		}
		
		log.debug("파일 삭제 성공 여부 = " + cnt);			

		if(cnt > 0  || cmntfiles.size() != 0 ) {
			log.debug("성공적으로 업데이트됨");
			ServletContext sc = request.getSession().getServletContext();
			String realPath = sc.getRealPath("/resources/uploads"); // 이클립스 가상 주소
			
			for (MultipartFile file : cmntfiles) {
				if(file.getOriginalFilename() != null) {
					log.debug("내 오리진 이름 보세요:" + file.getOriginalFilename());
					log.debug("내 타입 보세요: " + file.getContentType());
					log.debug("내 사이즈 보세요" + file.getSize());
					log.debug("내 이름 보세요 " + file.getName());
					log.debug("내 뭐든 보세요: " + file.toString()) ;
					UUID uuid = UUID.randomUUID();
					long file_size = file.getSize();				
					// file_name, file_originnm, file_size, file_path, file_type
					String file_name = uuid + file.getOriginalFilename();
					String file_originnm = file.getOriginalFilename();
					String file_path = "/resources/uploads/" + file_name;
					String file_type = file.getContentType();
					
					if(file_size == 0) {
						continue;
					}
					
					log.debug("fileName:" + file_originnm);
					
					CommunityFileVO cmntfile = new CommunityFileVO(cmnt_no, file_name, file_originnm, file_size, file_path, file_type);
					log.debug("파일 정보 : " + file.toString());
					
					cnt = mapper.updateCmntPostFile(cmntfile);
					
					// 첨부파일 정보가 db에 등록된 경우, 파일을 transfer
					file.transferTo(new File(realPath + "/" + file_name));				
				}
			}
		}
		return cnt;
	}

	@Override
	public int reportPost(Map<String, String> map) {
		return mapper.reportPost(map);
	}

	@Override
	public Map<String, Object> searchCmnt(Map<String, String> map) {
		List<CommunityVO> cmntList = mapper.searchCmnt(map);
		List<CommunityFileVO> cmntFileList = new ArrayList<CommunityFileVO>();
		for (CommunityVO communityVO : cmntList) {
			String cmnt_no = communityVO.getCmnt_no();
			int replyCount = mapper.countReply(cmnt_no);
			communityVO.setReply_count(replyCount); // 게시글별 달린 댓글 개수를 저장한다.
			
			CommunityFileVO communityFileVO = mapper.getCmntFileTotalList(cmnt_no); // cmnt에 해당하는 파일리스트만 가져온다.
			cmntFileList.add(communityFileVO);
		}
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cmntList", cmntList);
		searchMap.put("cmntFileList", cmntFileList);
		return searchMap;
	}

	@Override
	public CommunityVO getCmnt(String cmnt_no) {
		return mapper.getCmnt(cmnt_no);
	}

	@Override
	public int deleteReplyOne(String reply_no) {
		return mapper.deleteReplyOne(reply_no);
	}

	@Override
	public String cmntUploadSummernoteImageFile(MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		ServletContext sc = request.getSession().getServletContext();
		String realPath = sc.getRealPath("/resources/uploads"); // 이클립스 가상 주소
		
			if(multipartFile.getOriginalFilename() != null) {					
				UUID uuid = UUID.randomUUID();
				long file_size = multipartFile.getSize();				
				// file_name, file_originnm, file_size, file_path, file_type
				String file_name = uuid + multipartFile.getOriginalFilename();
				String file_originnm = multipartFile.getOriginalFilename();
				String file_path = "/resources/uploads/" + file_name;
				String file_type = multipartFile.getContentType();
				
				log.debug("fileName:" + file_originnm);

				// 첨부파일 정보가 db에 등록된 경우, 파일을 transfer
				multipartFile.transferTo(new File(realPath + "/" + file_name));				
				return file_path;
			}
			return null;
	}

	@Override
	public Map<String, Object> getCmntPopularList() {
		List<CommunityFileVO> cmntFileList = new ArrayList<CommunityFileVO>();
		
		List<CommunityVO> cmntList = mapper.getCmntPopularList();
		log.debug("인기많은 커뮤니티 리스트 : {}", cmntList.toString());
		for (CommunityVO communityVO : cmntList) {
			String cmnt_no = communityVO.getCmnt_no();
			CommunityFileVO communityFileVO = mapper.getCmntFileTotalList(cmnt_no); // cmnt에 해당하는 파일리스트만 가져온다.
			cmntFileList.add(communityFileVO);
		}
		
		Map<String, Object> cmntTotalMap = new HashMap<String, Object>();
		cmntTotalMap.put("cmntList", cmntList);
		cmntTotalMap.put("cmntFileList", cmntFileList);
		return cmntTotalMap;
	}


}
