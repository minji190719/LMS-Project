package org.hdcd.vo;

import lombok.Data;

@Data
public class BookVO {
	private String book_code;
	private String book_name;
	private String book_writer;
	private String book_company;
	private int book_pagecnt;
	private String book_category;
	private int book_state;
	private int book_stock;
}
