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
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovName() {
		return movName;
	}
	public void setMovName(String movName) {
		this.movName = movName;
	}
	public String getMrPlace() {
		return mrPlace;
	}
	public void setMrPlace(String mrPlace) {
		this.mrPlace = mrPlace;
	}
	public String getMrTime() {
		return mrTime;
	}
	public void setMrTime(String mrTime) {
		this.mrTime = mrTime;
	}
	public String getMrDate() {
		return mrDate;
	}
	public void setMrDate(String mrDate) {
		this.mrDate = mrDate;
	}
	public String getMrSit() {
		return mrSit;
	}
	public void setMrSit(String mrSit) {
		this.mrSit = mrSit;
	}
	public String getRsvPay() {
		return rsvPay;
	}
	public void setRsvPay(String rsvPay) {
		this.rsvPay = rsvPay;
	}
	public int getMrPeo() {
		return mrPeo;
	}
	public void setMrPeo(int mrPeo) {
		this.mrPeo = mrPeo;
	}
	
	
	
}
