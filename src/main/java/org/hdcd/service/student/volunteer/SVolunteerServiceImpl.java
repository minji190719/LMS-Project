package org.hdcd.service.student.volunteer;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.VolunteerMapper;
import org.hdcd.vo.VolunteerFileVO;
import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerOutVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class SVolunteerServiceImpl implements SVolunteerService{

	@Inject
	private VolunteerMapper mapper;
	
	@Override
	public List<VolunteerOutVO> volunteerOutSelectList(String id) {
		// TODO Auto-generated method stub
		return mapper.selectOutList(id);
	}
	
	@Override
	public Integer countMyTime(String id) throws Exception {
		// TODO Auto-generated method stub
		
		Integer res;
		res = mapper.selectMyTime(id);
		
		if(res == null) {
			res = 0;
		}
		log.debug("countMyTime 값 확인 : "+res);
		return res;
	}
	
	@Override
	public int registerOutVol(VolunteerOutVO vo,List<MultipartFile> volo_rfiles,HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---------------------"+volo_rfiles.size());
		
		System.out.println("?????1");
		
		ServletContext servletContext = req.getSession().getServletContext();
		String realpath = servletContext.getRealPath("resources/uploads");
		
		UUID uuid = UUID.randomUUID();
		
		VolunteerFileVO fileVO = new VolunteerFileVO();
		
		int res = mapper.insertOutVol(vo);
		
		System.out.println("?????2");
		
		File folder = new File(realpath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		for (int i = 0; i < volo_rfiles.size(); i++) {
			System.out.println("?????3");
			
			String saveFName = uuid + "_" + volo_rfiles.get(i).getOriginalFilename();
			String filePath = servletContext.getContextPath() + "/resources/uploads/" + saveFName;
			
			fileVO.setFile_originnm(volo_rfiles.get(i).getOriginalFilename());
			fileVO.setFile_name(saveFName);
			fileVO.setFile_path(filePath);
			fileVO.setVolo_code(vo.getVolo_code());
			
			System.out.println("?????4");
			int cnt = mapper.insertFiles(fileVO);
			System.out.println("?????5");
			
		
			volo_rfiles.get(i).transferTo(new File(realpath + "/" + volo_rfiles.get(i).getOriginalFilename()));
			
			System.out.println("?????6");
			
		}
		
		
			
		return 1;
	}

	@Override
	public void deleteOutRegister(String volo_code) throws Exception {
		// TODO Auto-generated method stub
		mapper.deleteFile(volo_code);
		mapper.deleteOutRegister(volo_code);
		
	}

	@Override
	public VolunteerListVO selectOneVideo(String voll_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectOneVideo(voll_code);
	}

	@Override
	public Integer selectMyInnerTime(String id) throws Exception {
		// TODO Auto-generated method stub
		Integer res;
		res = mapper.selectMyInTime(id);
		if(res == null) {
			res = 0;
		}
		log.debug("selectMyInnerTime 값 확인 : "+res);
		return res;
	}


}
