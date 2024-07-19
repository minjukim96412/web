package jspbasic.board;

import java.sql.SQLException;
import java.util.List;

public interface BoardInterface {
	  //* 기능 : 게시물목록, 게시물등록, 게시물수정, 게시물삭제, 조회수 증가
	//메소드 시그니쳐
	public abstract List<Board> listBoard(String bsort, String searchKeyword, String searchValue) throws SQLException;
	
	public abstract int registBoard(Board board) throws SQLException;
	
	public abstract Board getBoard(int bid) throws SQLException;
	
	public abstract int updateBoard(Board board) throws SQLException;
	
	public abstract int deleteBoard(int bid) throws SQLException;
	
	public abstract int addCount(int bid) throws SQLException;
	
	
}
