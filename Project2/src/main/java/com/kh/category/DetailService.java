package com.kh.category;

import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DetailService {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		ActionForward forward = new ActionForward();
		GoodsDTO goods = new GoodsDTO();
		GoodsDAO gdao = new GoodsDAO();
		
		String PRODUCT_ID = request.getParameter("PRODUCT_ID");
		goods = gdao.searchgoods(PRODUCT_ID);
		request.setAttribute("goods", goods);
		
		forward.setRedirect(false);
		forward.setPath("/category/goodsDetail/goodsDetail.jsp");
		
		return forward;
	}
}
