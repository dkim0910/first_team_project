package com.kh.mypage.action;

import com.kh.login.UserDTO;
import com.kh.mypage.dao.MemberDAO;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MembeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward(); // forward 정보를 담을 객체 생성
        MemberDAO dao = new MemberDAO(); // DAO 객체 생성
        HttpSession session = request.getSession(); // 세션 객체 가져오기
        UserDTO sessionMember = (UserDTO) session.getAttribute("member"); // 세션에서 로그인한 회원 정보 가져옴
        
        // 세션에 회원 정보가 없으면 로그인 페이지로 리다이렉트
        if (sessionMember == null) {
            forward.setPath("/login/join/login_view.jsp");
            forward.setRedirect(true);
            return forward;
        }
        
        // 수정된 회원 정보를 받아서 DTO 객체에 저장
        UserDTO member = new UserDTO();
        member.setUser_id(sessionMember.getUser_id()); 					// 세션에서 가져온 ID
        member.setUser_name(request.getParameter("user-Name")); 		// 수정된 이름
        member.setUser_pw(request.getParameter("user-Pw")); 			// 수정된 비밀번호
        member.setUser_phone(request.getParameter("user_phone")); 		// 수정된 전화번호
        member.setUser_address(request.getParameter("user_address")); 	// 수정된 주소
        member.setUser_gender(request.getParameter("user-Gender")); 	// 수정된 성별
        // DAO를 통해 회원 정보 수정
        if (dao.updateMember(member)) {
            //forward.setPath("/my-page/my-main/my-page-main.jsp"); 
            forward.setPath("/my-main/MemberList.up"); // 수정 완료 후 회원 정보 조회 페이지로 이동
            forward.setRedirect(true);
        } else {
            request.setAttribute("message", "회원 정보 수정 실패"); // 수정 실패 시 메시지 설정
            forward.setPath("/my-page/my-main/myinformation_update.jsp"); // 수정 페이지로 이동
            forward.setRedirect(false);
        }

        return forward;
    }

}
