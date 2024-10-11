package com.kh.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.kh.category.GoodsDTO;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteAction {
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
        // 장바구니에서 선택한 상품 빼기 성공시
        if(cdao.deleteItem(itemIdsArray)) {
        	forward.setRedirect(true);
        	forward.setPath("/cart.ca");
        }else {
        	forward.setRedirect(true);
        	forward.setPath("/cart.ca");
        }
		return forward;
	}
}
