package com.kh.login;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PwFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		
		String username = request.getParameter("user_name");
		String userphone = request.getParameter("user_phone");
		
		user = udao.searchByname(username, userphone);
		request.setAttribute("user", user);

		forward.setRedirect(false);
		if(user != null){	
			forward.setPath("/login/join/pw_find_view.jsp");
		} else { 			
			forward.setPath("/login/join/pw_find.jsp");
		}
		return forward;
	}

}
