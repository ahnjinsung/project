package com.maet.util.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginFormIntercepter extends HandlerInterceptorAdapter{

	//로그인 성공 후 post핸들러
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//로그인 성공시 생성되는 세션 userId
		String userId = (String)request.getSession().getAttribute("userId");
		String uri = (String)request.getSession().getAttribute("uri");
		if(uri != null && userId != null) { //로그인 성공, 기존에 접근하려는 uri가 있는 경우, uri로 이동
			response.sendRedirect(uri);
		}else if(userId != null){ //일반적인 로그인 성공인 경우, uri값은 없고 session값이 있는경우(로그인 성공으로 session에 값 저장-컨트롤러)
			response.sendRedirect( request.getContextPath() );
		}
		
		super.postHandle(request, response, handler, modelAndView);
		//로그인 실패시 컨트롤러에서 세션에 값이 저장되지도 않았기 때문에 메서드가 실행되지 않음. - 기존 컨트롤러대로 실행됨  
	}

	
}
