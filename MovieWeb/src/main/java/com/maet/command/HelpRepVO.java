package com.maet.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HelpRepVO {
	private int uhNo;
	private int uhRepNo;
	private String uhRepContent;
	public int getUhNo() {
		return uhNo;
	}
	public void setUhNo(int uhNo) {
		this.uhNo = uhNo;
	}
	public int getUhRepNo() {
		return uhRepNo;
	}
	public void setUhRepNo(int uhRepNo) {
		this.uhRepNo = uhRepNo;
	}
	public String getUhRepContent() {
		return uhRepContent;
	}
	public void setUhRepContent(String uhRepContent) {
		this.uhRepContent = uhRepContent;
	}
	public Timestamp getUhRepRegdate() {
		return uhRepRegdate;
	}
	public void setUhRepRegdate(Timestamp uhRepRegdate) {
		this.uhRepRegdate = uhRepRegdate;
	}
	private Timestamp uhRepRegdate;
}
