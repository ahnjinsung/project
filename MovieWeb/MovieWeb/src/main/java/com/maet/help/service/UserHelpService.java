package com.maet.help.service;

import java.util.ArrayList;

import com.maet.command.UserHelpVO;
import com.maet.paging.Criteria;

public interface UserHelpService {
	public void helpRegist(UserHelpVO vo); //고객센터 글등록
	//기본페이징
	public ArrayList<UserHelpVO> getList(Criteria cri); //기본페이징
	public int getTotal(); //전체 게시글 수
	
	public UserHelpVO content(int uhNo);
	public boolean update(UserHelpVO vo);
	public boolean delete(int uhNo);//삭제
	public ArrayList<UserHelpVO> myList(String userId);
	public int checkUpdate(int uhNo);
}
