package com.maet.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.maet.command.HelpRepVO;
import com.maet.help.service.UserHelpService;
import com.maet.reply.service.HelpReplyService;

@RestController
@RequestMapping("/reply")
public class HelpReplyController { //고객센터 답변
	
	@Autowired
	@Qualifier("helpReply")
	private HelpReplyService helpReplyService;
	
	
	@Autowired
	@Qualifier("userHelpService")
	private UserHelpService userHelpService;
	
	
	
	//댓글 등록
	@RequestMapping("/new")
	public int regist(@RequestBody HelpRepVO vo, Model model) {
		userHelpService.checkUpdate(vo.getUhNo());
		return helpReplyService.regist(vo);
		
		
	}
	
	//댓글 목록(url의 형태로 받기위해서 PathVariable)
	@RequestMapping("/getReply/{uhNo}/{pageNum}")
	public ArrayList<HelpRepVO> getReply(@PathVariable("uhNo") int uhNo,
										   @PathVariable("pageNum") int pageNum) {
		ArrayList<HelpRepVO> list = helpReplyService.getList(uhNo);	
		return list;
	}
	
	
	
}
