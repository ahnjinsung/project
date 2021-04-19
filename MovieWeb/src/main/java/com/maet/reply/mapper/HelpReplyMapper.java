package com.maet.reply.mapper;

import java.util.ArrayList;

import com.maet.command.HelpRepVO;

public interface HelpReplyMapper {

	public int regist(HelpRepVO vo); //고객센터 답변등록
	public ArrayList<HelpRepVO> getList(int uhNo); //댓글목록처리
	
	
}
