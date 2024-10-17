package com.kh.cart;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.ca")
public class CartFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}	
	
	protected void doProcess(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		// 장바구니에 저장된 상품 정보 불러오기
		if(requestURI.equals("/cart.ca")) { 
			forward = new CartListAction().execute(req, resp);
		}
		// 선택한 상품 구매하기 페이지로 보내기
		else if(requestURI.equals("/purchaseItems.ca")) { 
			forward = new PurchaseAction().execute(req, resp);
		}
		// 선택한 상품 장바구니에서 빼기
		else if(requestURI.equals("/deleteItems.ca")) { 
			forward = new DeleteAction().execute(req, resp);
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
