package org.hdcd.service.manager.scholar;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.ScholarMapper;
import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarHisVO;
import org.hdcd.vo.ScholarListVO;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerScholarServiceImpl implements IManagerScholarService{

	@Inject
	ScholarMapper mapper;
	
	// scholar_apply
	@Override
	public List<ScholarListVO> getScholarTotalList() {
		return mapper.getScholarTotalList();
	}

	@Override
	public int approveScholarship(ScholarApplyVO scholarApplyVO) {
		// scholarApplyVO 상태값 변경
		int cha_state = scholarApplyVO.getScha_state();
		if(cha_state == 1) { // 승인인 경우,
			scholarApplyVO.setScha_reject(""); // 넘어온 작성된 반려사유가 없습니다라는 텍스트를 지워준다.
		}
		
		int cnt = mapper.approveScholarship(scholarApplyVO); // approveScholarship 실행
		
		String scha_no = scholarApplyVO.getScha_no(); // 장학금 신청 번호
		
		if(cha_state == 1) { // 승인인 경우
			
			Map<String, Object> aprovedDetail = mapper.getApprovedDetails(scha_no); // 승인된 건의 상세 정보를 가져온다.
			
			String smem_no = (String) aprovedDetail.get("SMEM_NO");
			String schl_code = (String) aprovedDetail.get("SCHL_CODE");
			String schl_end = (String) aprovedDetail.get("SCHL_END");
			int schh_year = Integer.parseInt(schl_end.substring(0, 4));
			int schh_semester;
			int month = Integer.parseInt(schl_end.substring(5, 7));
			if(month == 1 || month == 2 || month == 3 || month == 4 || month == 5 || month == 6) {
				schh_semester = 1;
			}else{
				schh_semester = 2;
			}
			
			log.info("smem_no>>" + smem_no);
			log.info("schl_code>>" + schl_code);
			log.info("schl_end>>" + schl_end);
			log.info("schh_year>>" + schh_year);
			log.info("schh_semester>>" + schh_semester);
			
			ScholarHisVO scholarHisVO = new ScholarHisVO(smem_no, schl_code, schh_year, schh_semester); // 가져온 정보를 장학수혜내역 생성자를 통해 세팅한다.
			cnt = mapper.registerScholarHis(scholarHisVO); // 장학수혜내역에 등록한다.
			log.info("나는 장학수혜내역 등록에 성공했을까요?>>" + cnt);
		}	
		return cnt;
	}

	@Override
	public int scholarListManageRegister(ScholarListVO scholarListVO) {
		return mapper.scholarListManageRegister(scholarListVO);
	}

	@Override
	public List<ScholarListVO> getTotalScholarList() {
		return mapper.getTotalScholarList();
	}

}
