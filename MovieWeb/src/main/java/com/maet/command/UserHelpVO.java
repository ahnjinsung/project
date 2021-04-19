package com.maet.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserHelpVO {
	
	private int uhNo;
	private String userId;
	private String uhTitle;
	private String uhOption;
	private String uhContent;
	private Timestamp uhDate;
	private String uhCheck;
	public int getUhNo() {
		return uhNo;
	}
	public void setUhNo(int uhNo) {
		this.uhNo = uhNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUhTitle() {
		return uhTitle;
	}
	public void setUhTitle(String uhTitle) {
		this.uhTitle = uhTitle;
	}
	public String getUhOption() {
		return uhOption;
	}
	public void setUhOption(String uhOption) {
		this.uhOption = uhOption;
	}
	public String getUhContent() {
		return uhContent;
	}
	public void setUhContent(String uhContent) {
		this.uhContent = uhContent;
	}
	public Timestamp getUhDate() {
		return uhDate;
	}
	public void setUhDate(Timestamp uhDate) {
		this.uhDate = uhDate;
	}
	public String getUhCheck() {
		return uhCheck;
	}
	public void setUhCheck(String uhCheck) {
		this.uhCheck = uhCheck;
	}
	
	
	
}
