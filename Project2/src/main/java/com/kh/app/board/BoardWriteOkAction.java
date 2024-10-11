package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// dao 에서 insert -> insertBoard();
		// boardwrite.jsp 페이지로 이동
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO board = new BoardDTO();
		
		String boardtitle = request.getParameter("boardtitle");	// boardwrite.jsp name 값으로 받아오는게 getParameter 로 가지고온거랑 일치해야됨 
		String username = request.getParameter("username");
		String boardcontents = request.getParameter("boardcontents");
		
		board.setBoardtitle(boardtitle);
		board.setUsername(username);
		board.setBoardcontents(boardcontents);
		
		forward.setRedirect(true);
		
		if(bdao.insertBoard(board)) { 	// 성공시
			// boardnum seq 를 조회
			int boardnum = bdao.getSeq();
			// 성공한 글의 게시글 상세보기
			forward.setPath("/board/BoardView.bo?boardnum=" + boardnum);
			
		} else {						// 실패시	(빈값은 아님 그건 null 로 입력되서 저장됨)
			forward.setPath("/board/BoardWrite.bo?flag=false");
			
		}
		
		return forward;
		
	}
	
}
