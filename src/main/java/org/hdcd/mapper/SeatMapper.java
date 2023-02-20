package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.SeatVO;

@Mapper
public interface SeatMapper {

	public String selectMemName(String smem_no);

	public int updateNewSeat(@Param("seat_code") String seat_code,@Param("smem_no") String smem_no,
			@Param("stu_name")String stu_name,@Param("seat_start") String seat_start);

	public List<SeatVO> selectSeatList();

	public int updateExitSeat(String seat_code);

	public int updateSeatExtendTime(@Param("seat_code") String seat_code, @Param("seat_start") String seat_start);

}
