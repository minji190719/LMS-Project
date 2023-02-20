package org.hdcd.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarFileVO {
	private String schfile_code;
	private String file_name;
	private long file_size;
	private String file_originnm;
	private String file_path;
	private String scha_no;
	private String file_type;
	
	public ScholarFileVO() {};
	public ScholarFileVO(String file_name, long file_size, String file_originnm, String file_path,
			String scha_no, String file_type) {
		super();
		this.file_name = file_name;
		this.file_size = file_size;
		this.file_originnm = file_originnm;
		this.file_path = file_path;
		this.scha_no = scha_no;
		this.file_type = file_type;
	}
	
	
	
}
