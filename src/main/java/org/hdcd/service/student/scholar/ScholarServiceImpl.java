package org.hdcd.service.student.scholar;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

// import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.ScholarMapper;
import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarFileVO;
import org.hdcd.vo.ScholarListVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

// import kr.common.CommonDao;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ScholarServiceImpl implements IScholarService{
	
	@Inject
	ScholarMapper mapper;
	
	// @Resource(name="commonDao")
	// private CommonDao commonDao;
	
	@Override
	public List<ScholarListVO> getScholarList() {
		return mapper.getScholarList();
	}
	

	@Override
	public List<ScholarApplyVO> getScholarApplyList(String userId) throws Exception {
		return mapper.getScholarApplyList(userId);
		// return commonDao.list("getScholarApplyList", userId);
		
	}

	
	@Override
	public int insertScholarApply(HttpServletRequest request, ScholarApplyVO scholarApplyVO) throws IllegalStateException, IOException {
		/*
		String userId = (String) request.getSession().getAttribute("userId");
		
		ScholarApplyVO scholarApplyVO = new ScholarApplyVO();
		scholarApplyVO.setSmem_no(userId);
		scholarApplyVO.setSchl_code(schl_code);
		// 장학금 신청 INSERT
		int applyCnt = mapper.insertScholarApply(scholarApplyVO);
		
		// 장학금 신청 폼이 INSERT됐을 경우 장학증빙서류도 INSERT 후 파일 생성
		if(applyCnt > 0) {			
			ServletContext servletContext = request.getSession().getServletContext();
			String realPath = servletContext.getRealPath("/resources/uploads"); // 이클립스 가상 주소
			
			UUID uuid = UUID.randomUUID();
			String savedFileName = uuid + "_" + scholarFiles.getOriginalFilename(); // 저장할 파일 이름
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + savedFileName;
			ScholarFileVO scholarFileVO = new ScholarFileVO(savedFileName, scholarFiles.getSize(), scholarFiles.getOriginalFilename(),
					filePath, scholarApplyVO.getScha_no(), scholarFiles.getContentType());
			
			int fileCnt = mapper.insertScholarApplyFile(scholarFileVO);
			if(fileCnt > 0) {				
				scholarFiles.transferTo(new File(realPath + "/" + scholarFiles.getOriginalFilename()));
			}
			return fileCnt;
		}
		*/
		
		String userId = (String) request.getSession().getAttribute("userId");
		scholarApplyVO.setSmem_no(userId);
		
		// 장학금 신청 insert
		int applyCnt = mapper.insertScholarApply(scholarApplyVO);
		
		int fileCnt = 0;
		// 장학금 신청 폼이 INSERT됐을 경우 장학증빙서류도 INSERT 후 파일 생성
		if(applyCnt>0) {
			ServletContext servletContext = request.getSession().getServletContext();
			String realPath = servletContext.getRealPath("/resources/uploads"); // 이클립스 가상 주소
			log.info("realPath : {}", realPath);
			List<MultipartFile> scholarFiles = scholarApplyVO.getSchaFiles();
			for (MultipartFile file : scholarFiles) {
				String file_originnm = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				String file_name = uuid + file_originnm;
				long file_size = file.getSize();
				String file_type = file.getContentType();
				String file_path = servletContext.getContextPath() + "/resources/uploads/" + file_name;
				String scha_no = scholarApplyVO.getScha_no();
				ScholarFileVO scholarFileVO = new ScholarFileVO(file_name, file_size, file_originnm, file_path, scha_no, file_type);
				int cnt = mapper.insertScholarApplyFile(scholarFileVO);
				
				if(cnt>0) {
					file.transferTo(new File(realPath + "/" + file_name));
					fileCnt++;
				}
			} 
		}	
		return fileCnt;		
	}

	@Override
	public int scholarApplyDelete(String scha_no) {
		int cnt = mapper.scholarApplyFileDelete(scha_no); // 먼저 apply파일 삭제
		log.info("삭제된 파일 체크 : " + mapper.scholarApplyFileDelete(scha_no));
		
		if(cnt > 0) {
			 cnt = mapper.scholarApplyDelete(scha_no); // apply 삭제
		}
		return cnt;
	}




}
