package org.hdcd.vo;

import lombok.Data;

@Data
public class BookRentalVO {
	private String rent_code;
	private String smem_no;
	private String book_code;
	private String rent_start;
	private String rent_end;
	private int rent_expand;
	private int rent_bookcnt;
	private int rent_state;
	private int rent_overdue;
}
