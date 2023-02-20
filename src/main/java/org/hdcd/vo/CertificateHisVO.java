package org.hdcd.vo;

import lombok.Data;

@Data
public class CertificateHisVO {
	private String crtfh_code;
	private String smem_no;
	private String crtf_code;
	private String crtfh_date;
	private int crtfh_count;
	private int crtfh_ttlprice;
	private String crtfh_payway;
	private String download_type;
}
