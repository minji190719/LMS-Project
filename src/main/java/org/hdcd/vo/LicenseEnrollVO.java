package org.hdcd.vo;

import lombok.Data;

@Data
public class LicenseEnrollVO {
	private String licen_code;
	private String smem_no;
	private String licen_name;
	private String licen_company;
	private String licen_date;
	private String licen_num;
	private int enroll_state;
	private int licen_score;
	private String licen_kind;
	private String licen_reject;
	private String licen_filepath;
}
