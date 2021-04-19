package com.maet.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MovieRepVO {
	private int movRepNo;
	private int movNo;
	private String userId;
	private String movRepContent;
	private Timestamp movRepRegdate;
	public int getMovRepNo() {
		return movRepNo;
	}
	public void setMovRepNo(int movRepNo) {
		this.movRepNo = movRepNo;
	}
	public int getMovNo() {
		return movNo;
	}
	public void setMovNo(int movNo) {
		this.movNo = movNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovRepContent() {
		return movRepContent;
	}
	public void setMovRepContent(String movRepContent) {
		this.movRepContent = movRepContent;
	}
	public Timestamp getMovRepRegdate() {
		return movRepRegdate;
	}
	public void setMovRepRegdate(Timestamp movRepRegdate) {
		this.movRepRegdate = movRepRegdate;
	}
	
	
}
