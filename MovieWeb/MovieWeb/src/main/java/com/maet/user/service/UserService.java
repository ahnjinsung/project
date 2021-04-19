package com.maet.user.service;

import com.maet.command.MovieUserVO;
import com.maet.command.UserLoginVO;

public interface UserService {

	public int userJoin(MovieUserVO vo);
	public int idCheck(String userId);
	public String emailConfirm(String userEmail);
	public String findPw(MovieUserVO vo);
	public int userLogin(MovieUserVO vo);
	public MovieUserVO userInfo(String userId);
	public int putLoginDate(String userId);
	public int loginDateUpdate(String userId);
	public int userUpdate(MovieUserVO vo);
	public UserLoginVO userLoginInfo(String userId);
	
}
