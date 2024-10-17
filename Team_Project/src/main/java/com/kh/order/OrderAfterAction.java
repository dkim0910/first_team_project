package com.kh.order;

import java.util.List;

import com.kh.category.GoodsDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderAfterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderDAO odao = new OrderDAO();
		GoodsDTO gdto = new GoodsDTO();
		String itemIdsParam = req.getParameter("itemIds");
		// itemIds를 콤마로 분리하여 배열로 변환
		String[] itemIdsArray = null;
		if (itemIdsParam != null && !itemIdsParam.isEmpty()) {
			itemIdsArray = itemIdsParam.split(",");
		}
		List<GoodsDTO> cartList = odao.getByList(itemIdsArray);
		req.setAttribute("cartList", cartList);

		forward.setRedirect(false);
		forward.setPath("/order/order_confirmed.jsp");
		return forward;
	}

}
