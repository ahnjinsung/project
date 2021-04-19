package com.maet.moviepre.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.maet.command.MoviePreVO;


public interface MoviePreService {
	public ArrayList<MoviePreVO> getList(MoviePreVO vo);
	public int moviePreInsert(MoviePreVO vo);
	public ArrayList<MoviePreVO> preList();
	public ArrayList<MoviePreVO> myList(String userId);
	public int moviePreDelete (int rsvNo);
}
