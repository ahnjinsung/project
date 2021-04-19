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
	
	
	public int getMovNo() {
		return movNo;
	}


	public void setMovNo(int movNo) {
		this.movNo = movNo;
	}


	public String getMovName() {
		return movName;
	}


	public void setMovName(String movName) {
		this.movName = movName;
	}


	public String getMovContent() {
		return movContent;
	}


	public void setMovContent(String movContent) {
		this.movContent = movContent;
	}


	public String getMovStartDate() {
		return movStartDate;
	}


	public void setMovStartDate(String movStartDate) {
		this.movStartDate = movStartDate;
	}


	public String getMovEndDate() {
		return movEndDate;
	}


	public void setMovEndDate(String movEndDate) {
		this.movEndDate = movEndDate;
	}


	public String getMovUploadPath() {
		return movUploadPath;
	}


	public void setMovUploadPath(String movUploadPath) {
		this.movUploadPath = movUploadPath;
	}


	public String getMovFileLoca() {
		return movFileLoca;
	}


	public void setMovFileLoca(String movFileLoca) {
		this.movFileLoca = movFileLoca;
	}


	public String getMovFileName() {
		return movFileName;
	}


	public void setMovFileName(String movFileName) {
		this.movFileName = movFileName;
	}


	public String getMovFileRealName() {
		return movFileRealName;
	}


	public void setMovFileRealName(String movFileRealName) {
		this.movFileRealName = movFileRealName;
	}


	public String getMovMoney() {
		return movMoney;
	}


	public void setMovMoney(String movMoney) {
		this.movMoney = movMoney;
	}


	public ArrayList<MovieRepVO> getMovieRepList() {
		return movieRepList;
	}


	public void setMovieRepList(ArrayList<MovieRepVO> movieRepList) {
		this.movieRepList = movieRepList;
	}


	private ArrayList<MovieRepVO> movieRepList;
}
