package com.maet.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieUserVO {

	private String userId;
	private String userPw;
	private String userName;
	private int userBirYear;
	private int userBirMon;
	private int userBirDay;
	private int userPhone1;
	private int userPhone2;
	private int userPhone3;
	private String userEmail;
	private String addrZipNum;
	private String addrBasic;
	private String addrDetail;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserBirYear() {
		return userBirYear;
	}
	public void setUserBirYear(int userBirYear) {
		this.userBirYear = userBirYear;
	}
	public int getUserBirMon() {
		return userBirMon;
	}
	public void setUserBirMon(int userBirMon) {
		this.userBirMon = userBirMon;
	}
	public int getUserBirDay() {
		return userBirDay;
	}
	public void setUserBirDay(int userBirDay) {
		this.userBirDay = userBirDay;
	}
	public int getUserPhone1() {
		return userPhone1;
	}
	public void setUserPhone1(int userPhone1) {
		this.userPhone1 = userPhone1;
	}
	public int getUserPhone2() {
		return userPhone2;
	}
	public void setUserPhone2(int userPhone2) {
		this.userPhone2 = userPhone2;
	}
	public int getUserPhone3() {
		return userPhone3;
	}
	public void setUserPhone3(int userPhone3) {
		this.userPhone3 = userPhone3;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getAddrZipNum() {
		return addrZipNum;
	}
	public void setAddrZipNum(String addrZipNum) {
		this.addrZipNum = addrZipNum;
	}
	public String getAddrBasic() {
		return addrBasic;
	}
	public void setAddrBasic(String addrBasic) {
		this.addrBasic = addrBasic;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	
	
}
