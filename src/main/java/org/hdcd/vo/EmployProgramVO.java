package org.hdcd.vo;

import lombok.Data;

@Data
public class EmployProgramVO {
	private String epro_code;
	private String epro_name;
	private int epro_limit;
	private String epro_start;
	private String epro_end;
	private String epro_content;
	private String epro_charcontent;
	private int epro_curcnt;
}
