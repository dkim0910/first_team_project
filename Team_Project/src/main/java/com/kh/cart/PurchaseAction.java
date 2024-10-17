package com.kh.cart;

import java.util.List;

import com.kh.category.GoodsDTO;
import com.kh.login.UserDTO;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PurchaseAction {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		ActionForward forward = new ActionForward();
		CartDAO cdao = new CartDAO();
		GoodsDTO gdto = new GoodsDTO();
		String itemIdsParam = request.getParameter("itemIds");
		// itemIds를 콤마로 분리하여 배열로 변환
        String[] itemIdsArray = null;
        if (itemIdsParam != null && !itemIdsParam.isEmpty()) {
            itemIdsArray = itemIdsParam.split(",");
        }
		List<GoodsDTO> cartList = cdao.searchByList(itemIdsArray);
        request.setAttribute("cartList", cartList);
        
        forward.setRedirect(false);
		forward.setPath("/order/order_form.jsp");
		return forward;
	}
}
