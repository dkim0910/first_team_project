package com.kh.mypage.action;

import com.kh.login.UserDTO;
import com.kh.mypage.dao.MemberDAO;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward(); 	// forward 정보를 담을 객체 생성
        MemberDAO dao = new MemberDAO(); 				// DAO 객체 생성
        HttpSession session = request.getSession(); 	// 세션 객체 가져오기
        UserDTO sessionMember = (UserDTO) session.getAttribute("member"); // 세션에서 로그인한 회원 정보 가져옴

        // 세션에 회원 정보가 없으면 로그인 페이지로 리다이렉트
        if (sessionMember == null) {
            forward.setPath("/login/join/login_view.jsp");
            forward.setRedirect(true);
            return forward;
        }

        String user_id = sessionMember.getUser_id(); // 세션에서 회원 ID를 가져옴
        UserDTO member = dao.getMemberById(user_id); // DAO를 통해 회원 정보 조회

        // 회원 정보가 없으면 회원가입 페이지로 이동
        if (member == null) {
            forward.setPath("/login/join/join_view.jsp");
            forward.setRedirect(false);
            return forward;
        }
        
        // 회원 정보를 request에 저장하여 JSP에서 사용 가능하도록 설정
        session.setAttribute("member", member);
        // '나의 정보'를 보여줄 플래그 설정
        request.setAttribute("showMyInfo", true); 

        // 회원 정보를 출력할 JSP로 포워딩
        forward.setPath("/my-page/my-main/my-page-main.jsp");
        forward.setRedirect(false);

        return forward;
    }
}