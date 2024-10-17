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

public class RefundAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// 세션에서 꺼내오기
				HttpSession session = request.getSession();
				
				// 세션에 저장되어 있는 "member" 라는 걸 꺼내서 
				UserDTO member = (UserDTO) session.getAttribute("member");
				
				// getUser_id 로 "member" 안에 있는 user_id 만 꺼내옴 ("member"만 꺼내오면 오류남 String 이 아니라는 오류) 위 처럼 UserDTO 로 꺼내와야됨 
				String userid = member.getUser_id();
				
				if(member.getUser_id() != null){	
					// 로그인한 사용자 정보를 세션에 저장 (또 할 필요는 없는거 같은데)
//					HttpSession session = request.getSession();
//					session.setAttribute("member", member);
					MyDAO mydao = new MyDAO();
					
					List<MyDTO> Refunded = mydao.getRefunds(userid);
					request.setAttribute("Refunded", Refunded);
					
					forward.setRedirect(false);
				    forward.setPath("/my-page/refund/refund.jsp");
				} else { 			
					// 로그인 실패
					forward.setRedirect(true);
					forward.setPath("/login/join/login_view.jsp?flag=false");
				}
				
				return forward;
		
	}

}
