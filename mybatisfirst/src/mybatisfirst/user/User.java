package mybatisfirst.user;

public class User {
	private int sid;
	private String email;
	private String name;
	private String password;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int sid, String email, String name, String password) {
		super();
		this.sid = sid;
		this.email = email;
		this.name = name;
		this.password = password;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [sid=" + sid + ", email=" + email + ", name=" + name + ", password=" + password + "]";
	}
	
	
}
