package com.maet.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginVO {

	private String userId;
	private String userLoginIp;
	private Timestamp userLoginDate;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserLoginIp() {
		return userLoginIp;
	}
	public void setUserLoginIp(String userLoginIp) {
		this.userLoginIp = userLoginIp;
	}
	public Timestamp getUserLoginDate() {
		return userLoginDate;
	}
	public void setUserLoginDate(Timestamp userLoginDate) {
		this.userLoginDate = userLoginDate;
	}
	
	
}
