package com.maet.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MoviePreVO {
	private int rsvNo;
	private String userId;
	private String movName;
	private String mrPlace;
	private String mrTime;
	private String mrDate;
	private String mrSit;
	private String rsvPay;
	private int mrPeo;
	
}
