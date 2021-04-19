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
}
