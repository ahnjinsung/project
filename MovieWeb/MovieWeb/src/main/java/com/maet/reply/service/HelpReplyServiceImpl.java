package com.maet.reply.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maet.command.HelpRepVO;
import com.maet.reply.mapper.HelpReplyMapper;

@Service("helpReply")
public class HelpReplyServiceImpl implements HelpReplyService{
	
	
	@Autowired
	private HelpReplyMapper helpReplyMapper;
	
	@Override
	public int regist(HelpRepVO vo) {//답변등록		
		return helpReplyMapper.regist(vo);
	}

	@Override
	public ArrayList<HelpRepVO> getList(int uhNo) {
		return helpReplyMapper.getList(uhNo);
	}
	
	
	
}
