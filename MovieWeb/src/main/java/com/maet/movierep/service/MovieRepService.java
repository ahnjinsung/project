package com.maet.movierep.service;

import com.maet.command.MovieRepVO;

public interface MovieRepService {
	public int movieRepInsert(MovieRepVO vo);
	public int movieRepDelete(MovieRepVO vo);
	public int movieRepUpdate(MovieRepVO vo);
}
