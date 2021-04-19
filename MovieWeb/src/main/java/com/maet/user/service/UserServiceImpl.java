package com.maet.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.MovieUserVO;
import com.maet.command.UserLoginVO;
import com.maet.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int userJoin(MovieUserVO vo) {

		return userMapper.userJoin(vo);
	}

	@Override
	public int idCheck(String userId) {

		return userMapper.idCheck(userId);
	}

	@Override
	public int userLogin(MovieUserVO vo) {
		
		return userMapper.userLogin(vo);
	}

	@Override
	public MovieUserVO userInfo(String userId) {
		
		return userMapper.userInfo(userId);
	}
	
	@Override
	public int putLoginDate(String userId) {
		
		return userMapper.putLoginDate(userId);
	}

	@Override
	public int loginDateUpdate(String userId) {
		return userMapper.loginDateUpdate(userId);
	}

	@Override
	public int userUpdate(MovieUserVO vo) {
		return userMapper.userUpdate(vo);
	}

	@Override
	public UserLoginVO userLoginInfo(String userId) {
		
		return userMapper.userLoginInfo(userId);
	}

	@Override
	public String emailConfirm(String userEmail) {

		return userMapper.emailConfirm(userEmail);
	}

	@Override
	public String findPw(MovieUserVO vo) {
		
		return userMapper.findPw(vo);
	}


	

	

}
