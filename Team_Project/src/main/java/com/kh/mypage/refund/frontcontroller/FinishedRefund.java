package com.kh.mypage.refund.frontcontroller;

import java.util.List;

import com.kh.login.UserDTO;
import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDAO;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class FinishedRefund implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		
		// 세션에 있는 값 가지고 오기
//		String product_name = (String) session.getAttribute("product_name");
		String order_number = (String) session.getAttribute("order_number");
		
		// 세션에는 DTO로 되어 있으니 String 으로 변환하고 파라미터에 넣음 (제품 아이디 보내기)
		String ordernum = order_number;
		
		// 유저 아이디 값 보내기
        UserDTO member = (UserDTO) session.getAttribute("member");
        String userid = member.getUser_id();
        
        if(member.getUser_id() != null){	
			MyDAO mydao = new MyDAO();
			
			System.out.println(userid);
			System.out.println(ordernum);
			
			List<MyDTO> finishedRefund = mydao.finishedRefund(userid, ordernum);
			request.setAttribute("finishedRefund", finishedRefund);
			
			forward.setRedirect(false);
		    forward.setPath("/ordered.my");
		} else { 			
			// 로그인 실패
			forward.setRedirect(true);
			forward.setPath("/login/join/login_view.jsp?flag=false");
		}
		
		return forward;
		
	}

}
