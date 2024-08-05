package member;

import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDao implements MemberInterface {
	
	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
	static {
		try {
			reader = Resources.getResourceAsReader("conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public int getMember(Member member) throws SQLException {
		return ssf.openSession().selectOne("member.getMember", member);
	}

	    @Override
	    public int registMember(Member member) throws SQLException {
	        	SqlSession ss = ssf.openSession();
	        	
	            int count = ss.selectOne("member.existMember", member.getMid());
	            
	            if (count > 0) {
	                // 아이디가 이미 존재하는 경우
	                return -1;
	            }
	            ss.commit();
	            return ss.insert("member.registMember", member);
	            
	    }

	
} // class



















