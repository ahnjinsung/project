package com.maet.movierep.mapper;

import com.maet.command.MovieRepVO;

public interface MovieRepMapper {
	public int movieRepInsert(MovieRepVO vo);
	public int movieRepDelete(MovieRepVO vo);
	public int movieRepUpdate(MovieRepVO vo);
}
