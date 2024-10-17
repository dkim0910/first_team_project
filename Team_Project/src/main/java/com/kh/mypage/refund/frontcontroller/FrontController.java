package com.kh.mypage.refund.frontcontroller;

import java.io.IOException;
import java.util.Iterator;

import com.kh.mypage.refund.Action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.my")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch (requestURI) {
		// DB 상품 전체 조회
		case "/my/mypage.my":
			forward = new ProductAction().execute(req, resp);
			break;
		// 환불 페이지 값 넣는거 (아래 쪽 값을 가지고올거임)
		case "/refund.my":
			forward = new RefundAction().execute(req, resp);
			break;
		// 주문 내역 값 넣는거 (이게 먼저)
		case "/ordered.my":
			forward = new OrederedAction().execute(req, resp);
			break;
		// 회원 탈퇴
		case "/byebye.my":
			forward = new DeleteUserAction().execute(req, resp);
			break;
		// 로그 아웃
		case "/bye.my":
			forward = new LogoutAction().execute(req, resp);
			break;
		// 환불 완료후 의 환불 완료 랑 시간 update
		case "/finishedRefund.my":
			forward = new FinishedRefund().execute(req, resp);
			break;
		// 세션에 환불 완료에 필요한 값 불러오는거 (refund.jsp 에서 환불하기 누루면 오는거)
		case "/setSessionForProductsAtFinished-Refund.my":
			forward = new ProductSession().execute(req, resp);
			break;
		// 이벤트 / 가을 맞이 세일
		case "/selectouter.my":
			forward = new OuterSale().execute(req, resp);
			break;
		// 이벤트 / 3만원 이하의 제품 소개 세일
		case "/selectUnderthree.my":
			forward = new Underthree().execute(req, resp);
			break;
			
		}

		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}

	}
}
