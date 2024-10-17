package com.kh.category;

import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddService {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		ActionForward forward = new ActionForward();
		GoodsDTO goods = new GoodsDTO();
		GoodsDAO gdao = new GoodsDAO();
		
		String PRODUCT_ID = request.getParameter("PRODUCT_ID");
		String user_id = request.getParameter("user_id");
        String quantity = request.getParameter("quantity");
        // 상품 장바구니 db에 추가
        gdao.addgoods(user_id, PRODUCT_ID);
        
        // 상품 정보 다시 요청하기(포워드 방식일 경우에 사용)
        goods = gdao.searchgoods(PRODUCT_ID);
		request.setAttribute("goods", goods);
        
        //request.setAttribute("quantity", quantity); // 장바구니에 넣을 상품의 수량 나중에 추가
        
		forward.setRedirect(false);
		forward.setPath("/category/goodsDetail/goodsDetail.jsp");
        
        return forward;
	}
}
