package com.kh.login;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IdFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		
		// 클라이언트로부터 전달된 username 값을 가져옴
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		user = udao.searchByname(user_name, user_phone);
		request.setAttribute("user", user);

		forward.setRedirect(false);
		if(user != null){	
			forward.setPath("/login/join/id_find_view.jsp");
		} else {
			forward.setPath("/login/join/id_find.jsp");
		}
		return forward;
	}

}
