package com.maet.moviepre.mapper;

import java.util.ArrayList;

import com.maet.command.MoviePreVO;

public interface MoviePreMapper {
	public ArrayList<MoviePreVO> getList(MoviePreVO vo);
	public int moviePreInsert(MoviePreVO vo);
	public ArrayList<MoviePreVO> preList();
	public ArrayList<MoviePreVO> myList(String userId);
	public int moviePreDelete (int rsvNo);
}
