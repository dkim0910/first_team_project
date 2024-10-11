package com.kh.cart;

import java.util.List;

import com.kh.category.GoodsDTO;
import com.kh.login.UserDTO;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartListAction {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		ActionForward forward = new ActionForward();
		CartDAO cdao = new CartDAO();
		
		// 세션 객체 가져오기
		HttpSession session = request.getSession(); 	
		// 세션에서 로그인한 회원 정보 가져옴
        UserDTO sessionMember = (UserDTO)session.getAttribute("member"); 	
        // 세션에서 회원 ID를 가져옴
        String user_id = sessionMember.getUser_id(); 
        
		List<CartDTO> cartList = cdao.searchcartgoods(user_id);
		
		request.setAttribute("cartList", cartList);
		
		forward.setRedirect(false);
		forward.setPath("/cart/cart.jsp");

		return forward;
	}
}
