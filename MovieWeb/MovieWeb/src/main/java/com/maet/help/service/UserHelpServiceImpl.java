package com.maet.help.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.UserHelpVO;
import com.maet.help.mapper.UserHelpMapper;
import com.maet.paging.Criteria;
import com.maet.user.mapper.UserMapper;

@Service("userHelpService")
public class UserHelpServiceImpl implements UserHelpService{

	
	@Autowired
	private UserHelpMapper userHelpMapper;
	
	@Override
	public void helpRegist(UserHelpVO vo) {
		userHelpMapper.helpRegist(vo);
	}
	
	//기본페이징
	@Override
	public ArrayList<UserHelpVO> getList(Criteria cri) {
		return userHelpMapper.getList(cri);
	}
	
	//전체 게시글수
	@Override
	public int getTotal() {
		return userHelpMapper.getTotal();
	}
	
	//수정화면요청
	@Override
	public UserHelpVO content(int uhNo) {
		return userHelpMapper.content(uhNo);
	}
	
	
	//수정요청
	@Override
	public boolean update(UserHelpVO vo) {
		System.out.println(userHelpMapper.update(vo));
		return userHelpMapper.update(vo);
	}
	
	//삭제
	@Override
	public boolean delete(int uhNo) {
		return userHelpMapper.delete(uhNo);
	}

	@Override
	public ArrayList<UserHelpVO> myList(String userId) {
		return userHelpMapper.myList(userId);
	}

	@Override
	public int checkUpdate(int uhNo) {
		return userHelpMapper.checkUpdate(uhNo);
	}

}
