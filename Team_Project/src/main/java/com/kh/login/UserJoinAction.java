package com.kh.login;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		
		// 파라미터 값 setting
		user.setUser_id(request.getParameter("user_id"));
		user.setUser_pw(request.getParameter("user_pw"));
		user.setUser_name(request.getParameter("user_name"));
		user.setUser_phone(request.getParameter("user_phone"));
		user.setUser_gender(request.getParameter("user_gender"));
		user.setUser_address(request.getParameter("user_address"));
		
		// 회원가입 성공시
		if(udao.join(user)) {
			// redirect 여부 선택
			forward.setRedirect(true);
			forward.setPath("/login/join/login_view.jsp");
		// 회원가입 실패시
		}else {
			forward.setRedirect(true);
			forward.setPath("/index.html");
		}
		return forward;
	}

}
