package org.hdcd.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendApplyVO {
	private String aa_code;
	private String attend_code; 
	private int aa_state;
	private String aa_reject;
	private String aa_reason; 
	private String aa_detail;
	private MultipartFile applyfile;
}
