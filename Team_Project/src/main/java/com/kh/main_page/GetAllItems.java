package com.kh.main_page;

import java.io.IOException;
import java.util.List;

import org.json.simple.JSONObject;

import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetAllItems implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		MainDAO maindao = new MainDAO();
		List<MyDTO> getAllProducts = maindao.getAllProducts();
		request.setAttribute("getAllProducts", getAllProducts);
		
		forward.setRedirect(false);
		forward.setPath("/main-page/main.jsp");
		
		return forward;
	}

}
