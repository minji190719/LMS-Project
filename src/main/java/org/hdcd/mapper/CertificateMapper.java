package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.CertificateHisVO;
import org.hdcd.vo.CertificateVO;

public interface CertificateMapper {

	List<CertificateVO> getCertificateList();

	Map<String, Object> memberInfo(String userSession);

	void certificateApply(CertificateHisVO certificateHisVO);

	CertificateHisVO getCertificateHis(String crtfh_code);

	Map<String, Object> insertPOFInfo(String userId);

	List<CertificateHisVO> getCertificateHisList(String userSession);

}
