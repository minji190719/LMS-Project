package org.hdcd.vo;

import lombok.Data;

@Data
public class ScholarHisVO {
	private String schh_code;
	private String smem_no;
	private String schl_code;
	private String schh_date;
	private int schh_year;
	private int schh_semester;
	private int schh_state;
	
	public ScholarHisVO() {}
	
	public ScholarHisVO(String smem_no, String schl_code, int schh_year, int schh_semester) {
		this.smem_no = smem_no;
		this.schl_code = schl_code;
		this.schh_year = schh_year;
		this.schh_semester = schh_semester;
	}
	
	
}
