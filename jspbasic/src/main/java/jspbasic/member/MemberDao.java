package jspbasic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jspbasic.board.ConnectionUtil;

public class MemberDao implements MemberInterface {

    @Override
    public boolean getMember(Member member) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionUtil.getConnection();
            String sql = "SELECT * FROM MEMBER WHERE MID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMid());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("데이터베이스에서 가져온 비밀번호: " + rs.getString("MPASS"));
                // 아이디가 존재하고 비밀번호가 일치하는지 확인
                if (member.getMpass().equals(rs.getString("MPASS"))) {
                    System.out.println("비밀번호 일치");
                    return true;
                } else {
                    System.out.println("비밀번호 불일치");
                }
            } else {
                System.out.println("아이디 없음");
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
}




