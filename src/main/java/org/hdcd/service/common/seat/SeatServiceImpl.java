package org.hdcd.service.common.seat;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.SeatMapper;
import org.hdcd.vo.SeatVO;
import org.springframework.stereotype.Service;

@Service
public class SeatServiceImpl implements ISeatService{
	
	@Inject
	private SeatMapper mapper;
	
	@Override
	public String getName(String smem_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectMemName(smem_no);
	}

	@Override
	public int updateNewSeat(String seat_code, String smem_no,String stu_name,String seat_start) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateNewSeat(seat_code,smem_no,stu_name,seat_start);
	}

	@Override
	public List<SeatVO> selectAllSeatList() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectSeatList();
	}

	@Override
	public int updateExitSeat(String seat_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateExitSeat(seat_code);
	}

	@Override
	public int updateSeatExtendTime(String seat_code, String seat_start) {
		// TODO Auto-generated method stub
		return mapper.updateSeatExtendTime(seat_code,seat_start);
	}

}
