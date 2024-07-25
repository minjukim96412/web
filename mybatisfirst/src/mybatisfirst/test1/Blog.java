package mybatisfirst.test1;

import java.util.List;

public class Blog {
	private int id;
	private String title;
	private Author author;
	private List<Post> posts;
	
	public Blog() {
		// TODO Auto-generated constructor stub
	}
	
	public Blog(int id) {
		this.id =id;
	}
}
