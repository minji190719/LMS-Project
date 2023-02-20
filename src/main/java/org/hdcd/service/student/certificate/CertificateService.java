package org.hdcd.service.student.certificate;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.CertificateHisVO;
import org.hdcd.vo.CertificateVO;

public interface CertificateService {

	List<CertificateVO> getCertificateList();

	Map<String, Object> memberInfo(String userSession);

	String certificateApply(CertificateHisVO certificateHisVO, HttpServletRequest req) throws Exception;

	List<CertificateHisVO> getCertificateHisList(String userSession);
	
}
