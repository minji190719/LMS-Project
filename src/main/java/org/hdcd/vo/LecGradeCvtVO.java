package org.hdcd.vo;

import lombok.Data;

@Data
public class LecGradeCvtVO {
	private String lgc_code;
	private int lgc_attend;
	private int lgc_test;
	private int lgc_task;
	private int lgc_ranking;
	private String smem_no;
	private String lec_code;
	private int lgc_totalscore;
}
