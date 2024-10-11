package com.kh.login;

import java.io.IOException;
import java.io.PrintWriter;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
	    String user_id = request.getParameter("user_id");
	    String user_pw = request.getParameter("user_pw");
	    
	    UserDTO member = udao.login(user_id, user_pw);

	    try {
	        PrintWriter out = response.getWriter();
	        // 로그인 성공
	        if (member != null) {
	            // 로그인한 사용자 정보를 세션에 저장
	            HttpSession session = request.getSession();
	            session.setAttribute("member", member);
	            out.print("success");  // 성공 응답
	        } else {
	            // 로그인 실패
	            out.print("failure");  // 실패 응답
	        }
	        out.flush();
	        out.close(); // 응답 스트림 닫기
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return null; // AJAX 응답이므로 페이지 리디렉션이 필요 없음
	}

}
