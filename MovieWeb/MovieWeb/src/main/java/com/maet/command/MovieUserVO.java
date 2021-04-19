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
	
	
}
