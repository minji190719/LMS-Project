package org.hdcd.vo;

import lombok.Data;

@Data
public class ReportVO {
	private String report_no;
	private String cmnt_no;
	private String smem_no;
	private String report_reason;
	private String report_date;
	private int report_state;
	private String report_reject;
}
