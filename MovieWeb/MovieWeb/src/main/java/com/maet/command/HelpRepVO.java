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
	private Timestamp uhRepRegdate;
}
