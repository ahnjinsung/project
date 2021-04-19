package com.maet.movierep.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.MovieRepVO;
import com.maet.movierep.mapper.MovieRepMapper;

@Service("movieRepService")
public class MovieRepServiceImpl implements MovieRepService{

	@Autowired
	private MovieRepMapper mrm;
 
	@Override
	public int movieRepInsert(MovieRepVO vo) {
		return mrm.movieRepInsert(vo);
	}

	@Override
	public int movieRepDelete(MovieRepVO vo) {
		return mrm.movieRepDelete(vo);
	}

	@Override
	public int movieRepUpdate(MovieRepVO vo) {
		return mrm.movieRepUpdate(vo);
	}
	
	
}
