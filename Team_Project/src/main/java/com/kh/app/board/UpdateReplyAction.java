package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.ReplyDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// bdao.updateReply();	-> 댓글 수정
		// 상세페이지 보기페이지로 이동
		
		BoardDAO bdao = new BoardDAO();
		
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		String replycontents = request.getParameter("reply" + replynum);
		
		String boardnum = request.getParameter("boardnum");
		
		if(bdao.updateReply(replynum, replycontents)){
			forward.setRedirect(true);
			// 상세보기 페이지 
			forward.setPath("/board/BoardView.bo?boardnum=" + boardnum);
		}
		
		
		return forward;
	}
	
}
