package com.kh.mypage.refund.frontcontroller;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProductSession implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// jsp 페이지에서 name, value 값으로 값 가지고옴
		String product_name = request.getParameter("product-name"); 
		String order_number = request.getParameter("order-number"); 

		// 세션 열기
		HttpSession session = request.getSession();
		
		// 세션에 값들 저장
		session.setAttribute("product_name", product_name);
		session.setAttribute("order_number", order_number);
		
		forward.setRedirect(false);
		forward.setPath("/my-page/refund/finish-refund.jsp");
		
		return forward;
	}

}
