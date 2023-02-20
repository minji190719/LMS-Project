package org.hdcd.service.student.mypage;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.MypageMapper;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.MyPageVO;
import org.hdcd.vo.NoticeFileVO;
import org.hdcd.vo.RecordApplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageMapper mapper;
	
	
	@Override
	public List<MyPageVO>MypageList(String smem_no)throws Exception {
		return mapper.MypageList(smem_no);
	}

	@Override
	public List<RecordApplyVO> recordhis(String smem_no) {
		return mapper.recordhis(smem_no);
	}

	@Override
	public int updatepic(MemberVO memberVo,HttpServletRequest req) throws Exception {
		int cnt = mapper.updatepic(memberVo);
		return cnt;
	}

	@Override
	public int updateimg(List<MultipartFile> member_imagee, HttpServletRequest req) throws Exception {
		String mem_no = (String) req.getSession().getAttribute("userId");
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		MemberVO memberVo = new MemberVO();
		
		for (int i = 0; i < member_imagee.size(); i++) {
			
			String saveFName = uuid + "_" + member_imagee.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			memberVo.setMem_photopath(filePath);
			memberVo.setMem_no(mem_no);
			
			int cnt = mapper.updateimg(memberVo);
			member_imagee.get(i).transferTo(new File(realpath + "/" + saveFName));
			
		}
		return 0;
	}
}
