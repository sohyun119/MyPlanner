package com.SH.planner.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor{
	
	// 요청이 들어올 떼 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException{
		
		// 로그인 정보
		HttpSession session = request.getSession();
		
		// 현재 요청한 url 에 path == uri (ex: /user/signin_view)
		String uri = request.getRequestURI();
		
		// 로그인 상태일때
		if(session.getAttribute("userId") != null) {
			// 로그인 화면과, 회원가입 화면 접근시에 투두리스트 화면으로 이동
			
			if(uri.startsWith("/user/")) {
				response.sendRedirect("/plan/todoList_view");
				return false; // 목표로 했던 controller 로 위의 명령어 후에도 이동하려는 성질때문에 더이상의 페이지 이동이 없도록 해주어야함
			}
		}
		
		// 비 로그인 상태
		else {
			if(uri.startsWith("/plan")) {
				response.sendRedirect("/user/signin_view");
				return false;
			}
			else if(uri.startsWith("/diary")) {
				response.sendRedirect("/user/signin_view");
				return false;
			}
		}
		
		return true;

		
	}
	
	// ressponse 처리할 떼
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) {
		
	}
	
	// 모든 것이 완료 되었을 때
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) {
		
	}
	
	
	

}
