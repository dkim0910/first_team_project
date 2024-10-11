package com.kh.login;

import java.io.IOException;
import java.io.PrintWriter;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
        String userid = request.getParameter("user_id");

        try {
            // PrintWriter 객체 생성
            PrintWriter out = response.getWriter();
            // 아이디 중복 체크 결과에 따른 출력
            if (!udao.checkId(userid)) {
                // 회원가입 가능한 아이디일 경우
                out.print("ok");
            } else {
                // 회원가입 불가능한 중복된 아이디일 경우
                out.print("not-ok");
            }
            
            out.flush();
            out.close(); // 응답 스트림 닫기
        } catch (IOException e) {
            // IOException을 처리하는 코드
            e.printStackTrace();
        }

        return null; // AJAX 응답이므로 페이지 리디렉션이 필요 없음
	}

}
