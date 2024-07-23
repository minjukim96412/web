package jspbasic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import jspbasic.product.ConnectionUtil;

public class BoardDao implements BoardInterface{
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public List<Board> listBoard(String bsort, String searchKeyword, String searchValue) 
			throws SQLException {
		
		if (bsort==null) bsort = "";
		if (searchKeyword==null) searchKeyword = "";
		if (searchValue==null) searchValue = "";
		
		conn = ConnectionUtil.getConnection();
		
		String sql = " SELECT * FROM BOARD ";
		if (searchKeyword.equals("btitle")) {
			sql += " WHERE BTITLE LIKE '%" + searchValue + "%' ";
		} else if (searchKeyword.equals("bcontent")) {
			sql += " WHERE BCONTENT LIKE '%" + searchValue + "%' ";
		} else if (searchKeyword.equals("")) {
			sql += " WHERE (BTITLE LIKE '%" + searchValue + "%' ";
			sql += " OR BCONTENT LIKE '%" + searchValue + "%') ";
		}
		
		if (!bsort.equals("")) {
			sql += " AND BSORT='" + bsort + "' ";
		}
		
		sql += " ORDER BY BID DESC ";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs!=null) {
			List<Board> boardList = new ArrayList<Board>();
			while (rs.next()) {
				Board board = new Board();
				board.setBid(rs.getInt("BID"));
				board.setBtitle(rs.getString("BTITLE"));
				board.setBcontent(rs.getString("BCONTENT"));
				board.setBwriter(rs.getString("BWRITER"));
				board.setBcount(rs.getInt("BCOUNT"));
				board.setBregdate(rs.getTimestamp("BREGDATE"));
				board.setBsort(rs.getString("BSORT"));
				board.setCfn(rs.getString("CFN"));
				boardList.add(board);
			}
			return boardList;
		} else {
			return Collections.emptyList();
		}
	}

	@Override
	public int registBoard(Board board) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " insert into board values (seq_board.nextval,?,?,?,0,sysdate,?,?) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getBtitle());
		pstmt.setString(2, board.getBcontent());
		pstmt.setString(3, board.getBwriter());
		pstmt.setString(4, board.getBsort());
		pstmt.setString(5, board.getCfn());
		int result = pstmt.executeUpdate();
		ConnectionUtil.closeConnection(conn);
		return result;
	}

	@Override
	public int updateBoard(Board board) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " update board set bsort=?, btitle=?, bcontent=?, bregdate=?, cfn=?  where bid=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getBsort());
		pstmt.setString(2, board.getBtitle());
		pstmt.setString(3, board.getBcontent());
		pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		pstmt.setString(5, board.getCfn());
		pstmt.setInt(6, board.getBid());
		int result = pstmt.executeUpdate();
		ConnectionUtil.closeConnection(conn);
		return result;
	}

	@Override
	public int deleteBoard(int bid) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " delete board where bid=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bid);
		int result = pstmt.executeUpdate();
		ConnectionUtil.closeConnection(conn);
		return result;
	}

	@Override
	public int addCount(int bid) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " UPDATE BOARD SET BCOUNT = BCOUNT + 1 WHERE BID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bid);
		return pstmt.executeUpdate();
	}


	@Override
	public Board getBoard(int bid) throws SQLException {
			conn = ConnectionUtil.getConnection();
			String sql = "select * from board where bid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs!=null) {
				Board board = null;
				while(rs.next()) {
					board = new Board();
					board.setBid(rs.getInt("bid"));
					board.setBtitle(rs.getString("btitle"));
					board.setBcontent(rs.getString("bcontent"));
					board.setBwriter(rs.getString("bwriter"));
					board.setBcount(rs.getInt("bcount"));
					board.setBregdate(rs.getTimestamp("bregdate"));
					board.setBsort(rs.getString("bsort"));
					board.setCfn(rs.getString("cfn"));
				}
				ConnectionUtil.closeConnection(conn);
				return board;
			}
			return null;
	}

}
