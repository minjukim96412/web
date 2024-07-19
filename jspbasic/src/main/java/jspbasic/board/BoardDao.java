package jspbasic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import jspbasic.product.ConnectionUtil;

public class BoardDao implements BoardInterface{
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public List<Board> listBoard(String bsort, String searchKeyword, String searchValue) throws SQLException {
		if (bsort == null) bsort = "";
        if (searchValue == null) searchValue = "";
        if (searchKeyword == null) searchKeyword = "";

        conn = ConnectionUtil.getConnection();
        String sql = "SELECT * FROM board WHERE 1=1 ";
        
        if (bsort != null && !bsort.isEmpty()) {
            sql += "AND bsort = ? ";
        }
        
        if (searchKeyword.equals("btitle")) {
            sql += "AND btitle LIKE ? ";
        } else if (searchKeyword.equals("bcontent")) {
            sql += "AND bcontent LIKE ? ";
        } else if (searchKeyword.isEmpty()) {
            sql += "AND (btitle LIKE ? OR bcontent LIKE ?) ";
        }
        
        sql += "ORDER BY bid DESC";
        
        pstmt = conn.prepareStatement(sql);
        
        int paramIndex = 1;
        
        if (bsort != null && !bsort.isEmpty()) {
            pstmt.setString(paramIndex++, bsort);
        }
        
        if (searchKeyword.equals("btitle") || searchKeyword.equals("bcontent")) {
            pstmt.setString(paramIndex++, "%" + searchValue + "%");
        } else if (searchKeyword.isEmpty()) {
            pstmt.setString(paramIndex++, "%" + searchValue + "%");
            pstmt.setString(paramIndex++, "%" + searchValue + "%");
        }

        rs = pstmt.executeQuery();
        List<Board> boardList = new ArrayList<>();
        while (rs.next()) {
            Board board = new Board();
            board.setBid(rs.getInt("bid"));
            board.setBsort(rs.getString("bsort"));
            board.setBtitle(rs.getString("btitle"));
            board.setBcontent(rs.getString("bcontent"));
            board.setBwriter(rs.getString("bwriter"));
            board.setBcount(rs.getInt("bcount"));
            board.setBregdate(rs.getTimestamp("bregdate"));
            boardList.add(board);
        }
        ConnectionUtil.closeConnection(conn);
        return boardList;
    }

	@Override
	public int registBoard(Board board) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " insert into board values (seq_board.nextval,?,?,?,0,?,?) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getBtitle());
		pstmt.setString(2, board.getBcontent());
		pstmt.setString(3, board.getBwriter());
		pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		pstmt.setString(5, board.getBsort());
		int result = pstmt.executeUpdate();
		ConnectionUtil.closeConnection(conn);
		return result;
	}

	@Override
	public int updateBoard(Board board) throws SQLException {
		conn = ConnectionUtil.getConnection();
		String sql = " update board set bsort=?, btitle=?, bcontent=?, bregdate=? where bid=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getBsort());
		pstmt.setString(2, board.getBtitle());
		pstmt.setString(3, board.getBcontent());
		pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		pstmt.setInt(5, board.getBid());
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
			Board board = null;
			if(rs!=null) {
				List<Board> boardList = new ArrayList<Board>();
				while(rs.next()) {
					board = new Board();
					board.setBid(rs.getInt("bid"));
					board.setBtitle(rs.getString("btitle"));
					board.setBcontent(rs.getString("bcontent"));
					board.setBwriter(rs.getString("bwriter"));
					board.setBcount(rs.getInt("bcount"));
					board.setBregdate(rs.getTimestamp("bregdate"));
					board.setBsort(rs.getString("bsort"));
					boardList.add(board);
				}
				ConnectionUtil.closeConnection(conn);
				return board;
			}
			return board;
	}

}
