package org.hdcd.controller.common.seat;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.seat.ISeatService;
import org.hdcd.vo.SeatVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

/**
 * @author PC-08
 *
 */
@Slf4j
@Controller
@RequestMapping("/seat")
public class SeatReserve {
	
	@Inject
	private ISeatService service;
	
	/**
	 * [공통] 열람실 좌석 페이지 호출 메서드
	 * @param req
	 * @param model
	 * @return common/seat/seatReserve
	 * @throws Exception
	 */
	@GetMapping("/seatReserve")
	public String seatReservePage(HttpServletRequest req,Model model) throws Exception	{
		log.debug("seatReservePage 시작 ~");
		
		return "common/seat/seatReserve";
	}
	
	
	/**
	 * [공통] 좌석리스트를 불러오는 메서드
	 * @return seatList
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/getAllSeatList",produces = "application/json;charset=UTF-8")
	public List<SeatVO> seatList() throws Exception {
		log.debug("seatList 시작 ~");
		
		List<SeatVO> seatList = service.selectAllSeatList();
		
		return seatList;
	}
	
	
	
	/**
	 * [공통] 좌석 예약하기 메서드
	 * @param req
	 * @param seat_code
	 * @param stu_name
	 * @param seat_start
	 * @param model
	 * @return 예약이 완료되었습니다
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/reservation",produces = "text/plain;charset=UTF-8")
	public String reservationSeat(HttpServletRequest req, String seat_code, String stu_name,String seat_start, Model model) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		
		log.debug("reservationSeat 시작 ~");
		log.debug("smem_no 값 확인 : {}",smem_no);
		log.debug("sear 값 확인 : {}",seat_code );
		log.debug("stu_name 값 확인 : {}",stu_name );
		
		int count = service.updateNewSeat(seat_code,smem_no,stu_name,seat_start);
		
		return "예약이 완료되었습니다";
	}

	
	/**
	 * [공통] 좌석 연장하기 메서드
	 * @param req
	 * @param seat_code
	 * @param seat_start
	 * @return 연장이 완료되었습니다
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/extends",produces = "text/plain;charset=UTF-8")
	public String extendsSeat(HttpServletRequest req, String seat_code,String seat_start) throws Exception {
		String smem_no = (String) req.getSession().getAttribute("userId");
		log.debug("reservationSeat 시작 ~");
		log.debug("smem_no 값 확인 : {}",smem_no);
		log.debug("sear 값 확인 : {}",seat_code );
		log.debug("sear 값 확인 : {}",seat_start );
		
		int count = service.updateSeatExtendTime(seat_code,seat_start);
		
		return "연장이 완료되었습니다";
	}
	
	
	/** 
	 * [공통] 좌석 반납하기 메서드
	 * @param seat_code
	 * @param model
	 * @return 반납이 완료되었습니다!
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/seatExit",produces = "text/plain;charset=UTF-8")
	public String seatExit(String seat_code,Model model) throws Exception {
		log.debug("seatExit 시작 ~");
		
		int count = service.updateExitSeat(seat_code);
		
		return "반납이 완료되었습니다!";
	}
	
	
	
	
	
	
	
	
	
	
	
}












