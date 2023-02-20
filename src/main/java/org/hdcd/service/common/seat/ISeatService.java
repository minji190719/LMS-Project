package org.hdcd.service.common.seat;

import java.util.List;

import org.hdcd.vo.SeatVO;

public interface ISeatService {

	public String getName(String smem_no) throws Exception;

	public int updateNewSeat(String seat_code, String smem_no, String stu_name,String seat_start) throws Exception;

	public List<SeatVO> selectAllSeatList()  throws Exception;

	public int updateExitSeat(String seat_code) throws Exception;

	public int updateSeatExtendTime(String seat_code, String seat_start);

}
