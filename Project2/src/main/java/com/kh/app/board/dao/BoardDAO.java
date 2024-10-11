package com.kh.app.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis.SqlMapConfig;

public class BoardDAO {
	// 이건 기본으로 가지고 오면됨 DAO 면 
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public BoardDAO() {
		session = factory.openSession(true);
	}
	// 여기 까지는 복붙
	
	// 전체 회원 검색
	public List<BoardDTO> getBoardList(int startRow, int endRow){
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		List<BoardDTO> boardList = new ArrayList<>();
		boardList = session.selectList("Board.getBoardList", datas);	// .xml 에 있는거 가지고 옴 Board , getBoardList
		
		return boardList;
	}
	
	// 게시글 개수
	public int getBoardCnt() {
		return session.selectOne("Board.getBoardCnt");
	}

	// 게시글 등록
	public boolean insertBoard(BoardDTO board) {
		boolean result = false;
		
		if(session.insert("Board.insertBoard", board) == 1) {
			result = true;
		};
		
		return result;
	}
		
	// 글 보기
	public BoardDTO getDetail(int boardnum) {
		return (BoardDTO)session.selectOne("Board.getDetail", boardnum);
		
	}

	// 글 보면 글 본 횟수 1씩 증가
	public void updateReadCount(int boardnum) {
		session.update("Board.updateReadCount", boardnum);
		
	}

	public int getSeq() {
		return session.selectOne("Board.getSeq");
		
	}

	// 댓글 추가
	public boolean addReply(ReplyDTO reply) {
		boolean result = false;
		
		if(session.insert("Board.addReply",reply) == 1){
			result = true;
		}
		
		return result;
	}
	
	
	// 댓글 조회
	public List<ReplyDTO> getReplys(int boardnum) {
		return session.selectList("Board.getReplys", boardnum);
		
	}

	// 댓글 수정
	public boolean updateReply(int replynum, String replycontents) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("replycontents", replycontents);
		
		if(session.update("Board.updateReply", datas) == 1) {
			result = true;
		}
		
		return result;
	}

	// 댓글 삭제
	public boolean deleteReply(int replynum) {
		boolean result = false;
		
		if(session.delete("Board.deleteReply", replynum) == 1) {
			 result = true;
		}
		
		return result;
	}

		
	
	
	
}





