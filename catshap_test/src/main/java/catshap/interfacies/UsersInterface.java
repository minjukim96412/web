package catshap.interfacies;

import java.sql.SQLException;
import java.util.List;

import catshap.bean.Users;

public interface UsersInterface {
	
	public abstract List<Users> getUsersList() throws SQLException;
	
	public abstract int registUsers(Users users) throws SQLException;
	
}
