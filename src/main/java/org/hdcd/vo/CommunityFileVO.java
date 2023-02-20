package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityFileVO {
	private String cmntf_code;
	private String cmnt_no;
	private String file_name;
	private String file_originnm;
	private long file_size;
	private String file_path;
	private String file_type;
	
	public CommunityFileVO() {}
	public CommunityFileVO(String cmnt_no, String file_name, String file_originnm, long file_size2,
			String file_path, String file_type) {
		this.cmnt_no = cmnt_no;
		this.file_name = file_name;
		this.file_originnm = file_originnm;
		this.file_size = file_size2;
		this.file_path = file_path;
		this.file_type = file_type;
	}
	
	
}
