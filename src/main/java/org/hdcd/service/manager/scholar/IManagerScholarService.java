package org.hdcd.service.manager.scholar;

import java.util.List;

import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarListVO;

public interface IManagerScholarService {
	// sholar_apply
	List<ScholarListVO> getScholarTotalList();

	int approveScholarship(ScholarApplyVO scholarApplyVO);

	
	// sholar_list
	int scholarListManageRegister(ScholarListVO scholarListVO);

	List<ScholarListVO> getTotalScholarList();

}
