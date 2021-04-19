package com.maet.moviepre.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.MoviePreVO;
import com.maet.moviepre.mapper.MoviePreMapper;

@Service("moviePreService")
public class MoviePreServiceImpl implements MoviePreService{

	@Autowired
	private MoviePreMapper mpm;
	
	@Override
	public ArrayList<MoviePreVO> getList(MoviePreVO vo) {
		return mpm.getList(vo);
	}

	@Override
	public int moviePreInsert(MoviePreVO vo) {
		return mpm.moviePreInsert(vo);
	}

	@Override
	public ArrayList<MoviePreVO> preList() {
		return mpm.preList();
	}

	@Override
	public ArrayList<MoviePreVO> myList(String userId) {
		return mpm.myList(userId);
	}

	@Override
	public int moviePreDelete(int rsvNo) {
		return mpm.moviePreDelete(rsvNo);
	}

}
