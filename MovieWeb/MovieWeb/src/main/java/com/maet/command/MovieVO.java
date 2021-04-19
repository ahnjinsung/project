package com.maet.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieVO {
	private int movNo;
	private String movName;
	private String movContent;
	private String movStartDate;
	private String movEndDate;
	private String movUploadPath;
	private String movFileLoca;
	private String movFileName;
	private String movFileRealName;
	private String movMoney;
	
	
	private ArrayList<MovieRepVO> movieRepList;
}
