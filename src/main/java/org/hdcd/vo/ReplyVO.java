package org.hdcd.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private String reply_no;
	private String smem_no;
	private String cmnt_no;
	private String reply_content;
	private int reply_anony;
	private String reply_date;
}
