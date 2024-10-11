package com.kh.category;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.product")
public class CgFrontController extends HttpServlet{
			
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		// 카테고리마다 상품 추가
		if(requestURI.equals("/cg.product")) {
			forward = new CategoryService().execute(req, resp);
		}
		// 상품 상세페이지 보기
		else if(requestURI.equals("/scg.product")) {
			forward = new DetailService().execute(req, resp);
		}
		// 상품 구매하기
		else if(requestURI.equals("/purchase.product")) {
			forward = new PurchaseService().execute(req, resp);
		}
		// 상품 장바구니에 넣기
		else if(requestURI.equals("/add.product")) {
			forward = new AddService().execute(req, resp);
		}
        
        if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
	}
}
