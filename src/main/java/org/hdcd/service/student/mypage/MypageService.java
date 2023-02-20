package org.hdcd.service.student.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.MemberVO;
import org.hdcd.vo.MyPageVO;
import org.hdcd.vo.NoticeVO;
import org.hdcd.vo.RecordApplyVO;
import org.springframework.web.multipart.MultipartFile;

public interface MypageService {
	List<MyPageVO>MypageList(String smem_no)throws Exception;
	
	List<RecordApplyVO> recordhis(String smem_no);
	
	int updatepic(MemberVO memberVo, HttpServletRequest req)throws Exception;
	
	int updateimg(List<MultipartFile> member_imagee,HttpServletRequest req)throws Exception;
}
