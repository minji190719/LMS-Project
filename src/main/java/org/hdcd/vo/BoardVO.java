package org.hdcd.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private String board_no;
	private String dep_name;
	private String pmem_no;
	private String dep_code;
	private String board_title;
	private String board_content;
	private int board_count;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd")
	private Date board_date;
	private List<BoardFileVO> boardFileList;
}
