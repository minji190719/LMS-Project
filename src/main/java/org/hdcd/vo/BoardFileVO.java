package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardFileVO {
	private String brdfile_code;
	private String file_name;
	private String file_path;
	private String board_no;
	private String file_originnm;
	private long file_size;
	private String file_type;
}
