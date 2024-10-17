package com.kh.order.order_confirmed;

import java.util.List;

import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;
import com.kh.order.OrderDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderConfirmedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderDAO odao = new OrderDAO();

		HttpSession session = req.getSession();

		// 필요한 값들 추출
		String product_id = req.getParameter("PRODUCT_ID");
		String user_id = req.getParameter("user_id");

		odao.insertOrderedList(product_id, user_id);

		forward.setRedirect(false);
		forward.setPath("/order/order_confirmed.jsp");

		return forward;
	}

}
