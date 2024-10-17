package com.kh.order;

import java.io.IOException;

import com.kh.web.action.ActionForward;
import com.kh.login.UserJoinAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.or")
public class OrderFormFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String requestURI = req.getRequestURI();
		ActionForward forward = null;

//		 결제창
		if (requestURI.equals("/order/order_after.or")) {
			forward = new OrderAfterAction().execute(req, resp);
		}

		if (forward != null) {
			// true, redirect 방식으로 페이지 이동할 경우
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
				// false, forward 방식으로 페이지 이동할 경우
			} else {
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
	}
}
