package jspbasic.board;

import java.sql.SQLException;
import java.sql.Timestamp;

public class boardTest {
	public static void main(String[] args) throws SQLException{
		BoardDao boardDao = new BoardDao();
		
//		Board board = 
//				new Board(0, "제목", "내용", "작성자", 0, new Timestamp(System.currentTimeMillis()));
//		int result = boardDao.registBoard(board);
//		if(result > 0) {
//			System.out.println("등록 성공!");
//		}else {
//			System.out.println("등록 실패!");
//		}
		
//		System.out.println(boardDao.listBoard());
		
//		int result = boardDao.deleteBoard(5);
//		if (result > 0) {
//			System.out.println("삭제 완료!");
//		}else {
//			System.out.println("삭제 실패!");
//		}
		
		int result = boardDao.addCount(3);
		if(result > 0) {
			System.out.println("조회수 증가 성공!");
		}else {
			System.out.println("조회수 증가 실패!");
		}
	}
}
