package com.kh.mypage.refund.frontcontroller;

import java.util.List;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDAO;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OuterSale implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		MyDAO mydao = new MyDAO();
		List<MyDTO> selectoutersale = mydao.getOuterSale();
		
		request.setAttribute("outersale", selectoutersale);
		
		forward.setRedirect(false);
        forward.setPath("/my-page/events/outersale.jsp");
		
		return forward;
	}

}
