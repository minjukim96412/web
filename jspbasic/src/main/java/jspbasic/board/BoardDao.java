package jspbasic.board;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDao implements BoardInterface {

    private static Reader reader = null;
    private static SqlSessionFactory ssf = null;

    static {
        try {
            System.out.println("Loading MyBatis configuration...");
            reader = Resources.getResourceAsReader("conf/configuration.xml");
          
            ssf = new SqlSessionFactoryBuilder().build(reader);
            
            reader.close();
        } catch (Exception ex) {
            System.err.println("Error initializing SqlSessionFactory: " + ex.getMessage());
            ex.printStackTrace();
        }
    }


    @Override
    public List<Board> listBoard(String bsort, String searchKeyword, String searchValue) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            Search search = new Search(bsort, searchKeyword, searchValue);
            return ss.selectList("board.selectBoard", search);
        }
    }

    @Override
    public Board getBoard(int bid) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            return ss.selectOne("board.getBoard", bid);
        }
    }

    @Override
    public int registBoard(Board board) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.insert("board.registBoard", board);
            ss.commit();
            return result;
        }
    }

    @Override
    public int updateBoard(Board board) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.update("board.updateBoard", board);
            ss.commit();
            return result;
        }
    }

    @Override
    public int deleteBoard(int bid) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.delete("board.deleteBoard", bid);
            ss.commit();
            return result;
        }
    }

    @Override
    public int addCount(int bid) throws SQLException {
        if (ssf == null) {
            throw new IllegalStateException("SqlSessionFactory is not initialized.");
        }
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.update("board.addCount", bid);
            ss.commit();
            return result;
        }
    }
}















