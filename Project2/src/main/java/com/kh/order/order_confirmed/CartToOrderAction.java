package com.kh.order.order_confirmed;

import java.util.List;

import com.kh.cart.CartDTO;
import com.kh.category.GoodsDTO;
import com.kh.login.UserDTO;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;
import com.kh.order.OrderDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartToOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderDAO odao = new OrderDAO();

		// 유저 id
		HttpSession session = req.getSession();
		UserDTO sessionMember = (UserDTO) session.getAttribute("member");
		String user_id = sessionMember.getUser_id();

		// 구매할 상품 id 배열
		String itemIdsParam = req.getParameter("itemIds");
		// itemIds를 콤마로 분리하여 배열로 변환
		String[] itemIdsArray = null;
		if (itemIdsParam != null && !itemIdsParam.isEmpty()) {
			itemIdsArray = itemIdsParam.split(",");
		}

		// 1. 장바구니(cart) db에서 구매할 상품 삭제
		if (odao.deleteCart(itemIdsArray)) {
			System.out.println("success");
		}

		// 2. 주문내역(ordered) db에 구매한 상품 추가
		for (String itemID : itemIdsArray) {
			if (!odao.cartToOrder(user_id, itemID)) {
				System.out.println("fail");
			}
		}

		forward.setRedirect(false);
		forward.setPath("/order/order_confirmed.jsp");

		return forward;
	}

}
