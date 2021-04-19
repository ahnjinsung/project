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
	
}
