package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EnrollFeeVO {
	private String enrl_code;
	private int enrl_year;
	private int enrl_semester;
	private int enrl_admiss;
	private int enrl_fee;
	private int scholarship;
	private int enrl_total;
	private String enrl_date;
	private String enrl_bank;
	
	private String smem_no;
	private int enrl_row_number;
	private String mem_name;
	
	public EnrollFeeVO() {};
	

	public EnrollFeeVO(String smem_no, int enrl_year, int enrl_semester) {
		this.smem_no = smem_no;
		this.enrl_year = enrl_year;
		this.enrl_semester = enrl_semester;
	}
	
	public EnrollFeeVO(String smem_no, int enrl_year, int enrl_semester, int enrl_fee,
			int scholarship, int enrl_total) {
		this.smem_no = smem_no;
		this.enrl_year = enrl_year;
		this.enrl_semester = enrl_semester;
		this.enrl_fee = enrl_fee;
		this.scholarship = scholarship;
		this.enrl_total = enrl_total;
	}
}
