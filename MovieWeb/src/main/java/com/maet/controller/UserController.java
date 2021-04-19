package com.maet.controller;

import java.sql.Timestamp;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maet.command.MovieUserVO;
import com.maet.help.service.UserHelpService;
import com.maet.moviepre.service.MoviePreService;
import com.maet.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier("userHelpService")
	private UserHelpService userHelpService;
	
	@Autowired
	@Qualifier("moviePreService")
	private MoviePreService mps;
	
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/userJoin")
	public String userJoin(MovieUserVO vo) {
		return "user/userJoin";
	}
       
	@RequestMapping(value = "/userJoin_ok")
	public String userJoin_ok(MovieUserVO vo) {
		return "user/userJoin_ok";
	}

	@RequestMapping(value = "/userLogin")
	public String userLogin() {
		return "user/userLogin";
	}

	@RequestMapping(value = "/joinForm")
	public String joinForm(MovieUserVO vo) {

		if (userService.userJoin(vo) == 1) {
			if (userService.putLoginDate(vo.getUserId()) == 1) {
				return "user/userJoin_ok";
			} else {
				return "user/userJoin";
			}
		} else {
			return "user/userJoin";
		}
	}

	@RequestMapping(value = "/idConfirm")
	@ResponseBody
	public int idConfirm(@RequestBody MovieUserVO vo) {
		return userService.idCheck(vo.getUserId());
	}

	@RequestMapping(value = "/loginForm")
	public String loginForm(MovieUserVO vo, RedirectAttributes RA, HttpSession session, Model model) {
		if (userService.userLogin(vo) == 1) {
			String userId = vo.getUserId();
			session.setAttribute("userId", userId);
			Timestamp loginDate = userService.userLoginInfo(userId).getUserLoginDate();
			
			if(userService.loginDateUpdate(userId) == 1) {
				String userName = userService.userInfo(userId).getUserName();
				session.setAttribute("userName", userName);
				session.setAttribute("userLoginDate", loginDate);
				return "redirect:/";
			}else {
				return "user/userLogin";
			}
		} else {
			RA.addFlashAttribute("msg", "아이디와 비밀번호를 확인하세요");
			return "redirect:/user/userLogin";
		}
	}

	@RequestMapping(value = "/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/userPage")
	public String userPage(@RequestParam("option") String option,Model model, HttpSession session) {
		System.out.println(option);
		String userId = (String) session.getAttribute("userId");
		System.out.println("세션아이디: " + userId);
		model.addAttribute("movieUserVO", userService.userInfo(userId));
		model.addAttribute("helpVO",userHelpService.myList(userId));
		model.addAttribute("preVO", mps.myList(userId));
		if(option.equals("userPage")) {
			model.addAttribute("att", "userPage");
		}else if(option.equals("userPre")) {
			model.addAttribute("att", "userPre");
		}else if(option.equals("userHelp")) {
			model.addAttribute("att", "userHelp");
		}
		return "/user/userPage";
	}
	
	
	@RequestMapping(value = "/userUpdate")
	@ResponseBody
	public int userUpdate(@RequestBody MovieUserVO vo) {
		return userService.userUpdate(vo);
	}
	
	@RequestMapping(value="/emailConfirm")
	@ResponseBody
	public String emailConfirm(@RequestBody MovieUserVO vo) {
		if(userService.emailConfirm(vo.getUserEmail()) != null) {
			return userService.emailConfirm(vo.getUserEmail());
		}else {
			return "";
		}
	}
	
	@RequestMapping(value="/findPw")
	@ResponseBody
	public String findPw(@RequestBody MovieUserVO vo, HttpSession session) {
		
		String setfrom = "iiiooopppeee@gmail.com";         
	    String tomail  = vo.getUserEmail();     
	    String title   = "[메가박스] 비밀번호 찾기 이메일인증";      
	    String content = "인증확인 : " + "http://localhost:8181/movieweb/user/findPwOk";
		if(userService.findPw(vo) != null) {
			session.setAttribute("userPw", userService.findPw(vo));
			try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		                          = new MimeMessageHelper(message, true, "UTF-8");
		        messageHelper.setFrom(setfrom);  
		        messageHelper.setTo(tomail);     
		        messageHelper.setSubject(title); 
		        messageHelper.setText(content);
		        mailSender.send(message);
		      } catch(Exception e){
		        System.out.println(e);
		      }
			return userService.findPw(vo);
		}else {
			return "";
		}
	}
	
	@RequestMapping(value="/findPwOk")
	public String findPwOk(HttpSession session, Model model) {
		if(session.getAttribute("userPw") != null) {
			String userPw = "";
			userPw = (String)session.getAttribute("userPw");
			session.removeAttribute("userPw");
			model.addAttribute("userPw", userPw);
			return "user/findPwOK";
		}else {
			return "redirect:/";
		}
	}

}
