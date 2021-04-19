package com.maet.movie.mapper;

import java.util.ArrayList;

import com.maet.command.MovieAdminVO;
import com.maet.command.MovieVO;

public interface MovieMapper {
	public ArrayList<MovieVO> movieList();
	public MovieVO movieDetail(int movNo);
	public MovieVO movieOneList(int movNo);
	public boolean movieInsert(MovieVO vo);
	public int movieDelete(MovieVO vo);
	public int adminLogin(MovieAdminVO vo);
}
