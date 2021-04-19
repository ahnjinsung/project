package com.maet.movie.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.MovieAdminVO;
import com.maet.command.MovieVO;
import com.maet.movie.mapper.MovieMapper;

@Service("movieService")
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper mm;
	
	@Override
	public ArrayList<MovieVO> movieList() {
		return mm.movieList();
	}

	@Override
	public MovieVO movieDetail(int movNo) {
		return mm.movieDetail(movNo);
	}

	@Override
	public MovieVO movieOneList(int movNo) {
		return mm.movieOneList(movNo);
	}

	@Override
	public boolean movieInsert(MovieVO vo) {
		return mm.movieInsert(vo);
	}

	@Override
	public int movieDelete(MovieVO vo) {
		return mm.movieDelete(vo);
	}

	@Override
	public int adminLogin(MovieAdminVO vo) {
		return mm.adminLogin(vo);
	}
	
}
