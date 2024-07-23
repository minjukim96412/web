package jspbasic.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspbasic.product.ConnectionUtil;

public class ReplyDao implements ReplyInterface {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    @Override
    public Reply getReply(int rid) throws SQLException {
        conn = jspbasic.board.ConnectionUtil.getConnection();
        String sql = "SELECT * FROM REPLY WHERE RID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, rid);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            Reply reply = new Reply();
            reply.setRid(rs.getInt("rid"));
            reply.setMid(rs.getString("mid"));
            reply.setRcontent(rs.getString("rcontent"));
            reply.setBid(rs.getInt("bid")); // bid 추가
            ConnectionUtil.closeConnection(conn);
            return reply;
        }
        return null;
    }

    @Override
    public int registReply(Reply reply) throws SQLException {
        conn = ConnectionUtil.getConnection();
        String sql = "INSERT INTO reply VALUES (seq_reply.nextval, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, reply.getMid());
        pstmt.setString(2, reply.getRcontent());
        pstmt.setInt(3, reply.getBid()); // bid 추가
        int result = pstmt.executeUpdate();
        ConnectionUtil.closeConnection(conn);
        return result;
    }

    @Override
    public List<Reply> listReplies(int bid) throws SQLException {
        List<Reply> replyList = new ArrayList<>();
        conn = ConnectionUtil.getConnection();
        String sql = "SELECT * FROM REPLY WHERE BID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bid);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Reply reply = new Reply();
            reply.setRid(rs.getInt("rid"));
            reply.setMid(rs.getString("mid"));
            reply.setRcontent(rs.getString("rcontent"));
            reply.setBid(rs.getInt("bid")); // bid 추가
            replyList.add(reply);
        }
        ConnectionUtil.closeConnection(conn);
        return replyList;
    }
    
    @Override
    public boolean updateReply(int rid, String newContent) throws SQLException {
        conn = ConnectionUtil.getConnection();
        String sql = "UPDATE reply SET rcontent=? WHERE rid=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newContent);
        pstmt.setInt(2, rid);
        int result = pstmt.executeUpdate();
        ConnectionUtil.closeConnection(conn);
        return result > 0;
    }

    @Override
    public boolean deleteReply(int rid) throws SQLException {
        conn = ConnectionUtil.getConnection();
        String sql = "DELETE FROM reply WHERE rid=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, rid);
        int result = pstmt.executeUpdate();
        ConnectionUtil.closeConnection(conn);
        return result > 0;
    }
    
}




