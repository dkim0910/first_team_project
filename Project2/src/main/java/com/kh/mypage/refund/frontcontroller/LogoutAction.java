package com.kh.mypage.refund.frontcontroller;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		// 이거 필요 없지 않나? 가지고올 값이 없는데
//		UserDTO member = (UserDTO) session.getAttribute("member");
		
		// 아이디 비번 세션 삭제
		session.removeAttribute("member");
		
		// 세션 저장된 나의 정보로 돌아오는 용도의 세션
		session.getAttribute("showMyInfo");
		
		// 나의 정보로 돌아오는 용도의 세션 삭제
		session.removeAttribute("showMyInfo");
		
		forward.setRedirect(true);
	    forward.setPath("/index.jsp");
		
		return forward;
	}

}
