package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.ReplyDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// dao -> addReply();
		
		BoardDAO bdao = new BoardDAO();
		ReplyDTO reply = new ReplyDTO();

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String replycontents = request.getParameter("replycontents");
		
		reply.setBoardnum(boardnum);
		reply.setUsername(username);
		reply.setPassword(password);
		reply.setReplycontents(replycontents);
		
		if(bdao.addReply(reply)) {
			forward.setRedirect(true);
			forward.setPath("/board/BoardView.bo?boardnum=" + boardnum);
		}
		
		return forward;
	}
	
}








