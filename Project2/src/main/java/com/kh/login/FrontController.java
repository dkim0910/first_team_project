package com.kh.login;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.fr")
public class FrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		// 회원가입
		if(requestURI.equals("/join/userjoin.fr")) {
			forward = new UserJoinAction().execute(req, resp);
		}
		// 아이디 중복 체크
		else if(requestURI.equals("/join/checkId.fr")) {
			forward = new CheckIdAction().execute(req, resp);
		}
		// 로그인
		else if(requestURI.equals("/join/userlogin.fr")) {
			forward = new UserLoginAction().execute(req, resp);
		}
		// 아이디 찾기
		else if(requestURI.equals("/join/idfind.fr")) {
			forward = new IdFindAction().execute(req, resp);
		}
		// 비밀번호 찾기
		else if(requestURI.equals("/join/pwfind.fr")) {
			forward = new PwFindAction().execute(req, resp);
		}
		
		if(forward != null) {
			// true, redirect 방식으로 페이지 이동할 경우
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			// false, forward 방식으로 페이지 이동할 경우	
			}else {
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
	}
}
