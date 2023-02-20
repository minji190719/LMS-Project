package org.hdcd.vo;

import lombok.Data;

@Data
public class FoodCalendarVO {
	private String food_code;
	
	private String food_date;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String dayofweek;
}
