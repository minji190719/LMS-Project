package org.hdcd.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarApplyVO {
	private String scha_no;
	private String smem_no;
	private String schl_code;
	private String scha_date;
	private int scha_state;
	private String scha_reject;
	private String scha_cdate;
	private List<MultipartFile> schaFiles;
	private List<ScholarFileVO> schaFileList;
	
	private String scha_number;
}
