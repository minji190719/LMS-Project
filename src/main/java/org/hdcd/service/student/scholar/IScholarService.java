package org.hdcd.service.student.scholar;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarListVO;
import org.springframework.web.multipart.MultipartFile;

public interface IScholarService {

	List<ScholarListVO> getScholarList();

	List<ScholarApplyVO> getScholarApplyList(String userId)  throws Exception;

	int insertScholarApply(HttpServletRequest request, ScholarApplyVO scholarApplyVO) throws IllegalStateException, IOException;

	int scholarApplyDelete(String scha_no);
}
