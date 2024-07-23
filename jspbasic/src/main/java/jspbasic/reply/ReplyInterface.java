package jspbasic.reply;

import java.sql.SQLException;
import java.util.List;

public interface ReplyInterface {
	public Reply getReply(int bid) throws SQLException;
	public int registReply(Reply reply) throws SQLException;
	public List<Reply> listReplies(int bid) throws SQLException;
	public boolean deleteReply(int rid) throws SQLException;
	public boolean updateReply(int rid, String newContent) throws SQLException;
}
