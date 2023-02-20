package org.hdcd.vo;

import lombok.Data;

@Data
public class AttendanceVO {
	private String attend_code;
	private String lec_code;
	private String smem_no;
	private int attend_state;
	private String attend_reason;
	private String attend_week;
	private String attend_day;
}
