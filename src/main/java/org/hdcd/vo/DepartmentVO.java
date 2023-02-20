package org.hdcd.vo;

import lombok.Data;

@Data
public class DepartmentVO {
	private String dep_code;
	private String col_code;
	private String dep_name;
	private int dep_fee;
	private int dep_limit;
	private String dep_tel;
	private int dep_mnl;
	private int dep_mcl;
	private int dep_cnl;
	private int dep_ccl;
}
