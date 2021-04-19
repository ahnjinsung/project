package com.maet.command;

import lombok.Data;

@Data
public class MovieAdminVO {
	private String adminId;
	private String adminPw;
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
	
}
