package com.kh.mypage.refund.frontcontroller;

import com.kh.login.UserDTO;
import com.kh.mypage.refund.Action.Action;
import com.kh.mypage.refund.Action.ActionForward;
import com.kh.mypage.refund.Beans_DAO_DTO.MyDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		MyDAO mydao = new MyDAO();

		// 세션 가지고옴
		HttpSession session = request.getSession();

		// userDTO 에서 "member" 서션 가지고옴
		UserDTO member = (UserDTO) session.getAttribute("member");

		// 세션에 저장되어 있는 아이디 값만 가지고옴
		String userid = member.getUser_id();

		// 세션에 저장되 어 있는 "member" 삭제 (위 저장된 값 아래에 넣으면 delete 문은 되는거 같음 위에 적어도 괜찮나? )
		session.removeAttribute("member");

		// 세션 저장된 나의 정보로 돌아오는 용도의 세션
		session.getAttribute("showMyInfo");

		// 나의 정보로 돌아오는 용도의 세션 삭제
		session.removeAttribute("showMyInfo");

		// 가지고 온 아이디로 xml 에 delete 문 보내서 사용자 삭제
		mydao.deleteUser(userid);

		forward.setRedirect(true);
		forward.setPath("/index.jsp");

		return forward;

	}

}
