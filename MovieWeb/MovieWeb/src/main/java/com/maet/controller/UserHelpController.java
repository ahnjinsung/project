package com.maet.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maet.command.UserHelpVO;
import com.maet.help.service.UserHelpService;
import com.maet.paging.Criteria;
import com.maet.paging.PageVO;

@Controller
@RequestMapping(value="/userHelp")
public class UserHelpController {
	
	@Autowired
	@Qualifier("userHelpService")
	private UserHelpService userHelpService;

	@RequestMapping(value="userHelp")
	public String userHelp() {
		return "userHelp/userHelp";
	}
	
	@RequestMapping(value="/userHelpWrite")
	public String userHelpWrite() {
		return "userHelp/userHelpWrite";
	}
	
	@RequestMapping(value="/userHelpDetail")
	public String userHelpDetail() {
		return "userHelp/userHelpDetail";
	}
	
	@RequestMapping(value="/userHelpUpdate")
	public String userHelpUpdate() {
		return "userHelp/userHelpUpdate";
	}
	
	//고객센터 글등록
	@RequestMapping("/helpRegistForm")
	public String registFrom(UserHelpVO vo, RedirectAttributes RA) {
		System.out.println("1. 글쓰기 등록 컨트롤러");
		
		userHelpService.helpRegist(vo);
		
		RA.addFlashAttribute("msg", "게시물이 정상적으로 등록되었습니다");
		
		return "redirect:/userHelp/userHelp";
	}
	
	
	@RequestMapping(value = "/userHelp", method=RequestMethod.GET)
	public String freeList(Model model, Criteria cri) {

		//고객센터 페이징
		ArrayList<UserHelpVO> list = userHelpService.getList(cri);
		int total = userHelpService.getTotal();
		PageVO pageVO = new PageVO(cri, total);

		System.out.println("넘어오는값:" + cri.toString());
		
		model.addAttribute("pageVO", pageVO);  //페이지네이션 정보
		model.addAttribute("helpList", list); //게시글 정보
		System.out.println();
		
		return "userHelp/userHelp";
	}

	//상세화면
	@RequestMapping(value = "/userHelpDetail", method=RequestMethod.GET)
	public String freeDetail(@RequestParam("uhNo") int uhNo, Model model) {
		//서비스의 content호출 mapper의 content호출
		//모델에 담아서 userHelpVO 이름으로 화면에 전달, 화면처리
		UserHelpVO vo = userHelpService.content(uhNo);
		model.addAttribute("userHelpVO", vo);
		return "userHelp/userHelpDetail";
	}
	
	//수정화면으로
	@RequestMapping(value = "/userHelpUpdate" , method=RequestMethod.POST)
	public String userHelpUpdate(@RequestParam("uhNo") int uhNo, Model model) {
		UserHelpVO vo = userHelpService.content(uhNo);
		model.addAttribute("userHelpVO", vo);
		
		return "userHelp/userHelpUpdate";
	}
	
	//수정요청
	@RequestMapping(value = "/userHelpModify")
	public String userHelpModify(UserHelpVO vo, RedirectAttributes RA) {
		System.out.println(vo);
		boolean result = userHelpService.update(vo);
		
		if(result) {
			RA.addFlashAttribute("msg", "게시물 수정이 정상 처리되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 수정에 실패했습니다");
		}
		return "redirect:/userHelp/userHelp";
	}
	
	//삭제
	@RequestMapping("/userHelpDelete")
	public String userHelpDelete(@RequestParam("uhNo") int uhNo, RedirectAttributes RA) {
		boolean result = userHelpService.delete(uhNo);
		
		if(result) {
			RA.addFlashAttribute("msg", "게시물이 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 삭제에 실패했습니다");
		}
			
		return "redirect:/userHelp/userHelp";
	}
	
	
	
	
}
