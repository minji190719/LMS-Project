package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.MyPageVO;
import org.hdcd.vo.RecordApplyVO;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface MypageMapper {

	List<MyPageVO>MypageList(String smem_no);
	
	List<RecordApplyVO> recordhis(String smem_no);
	
	int updatepic(MemberVO memberVo)throws Exception;
	
	int updateimg(MemberVO memberVo)throws Exception;
}
