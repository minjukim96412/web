package jspmvc.vo;

public class Person {
	private int pid;
	private String name;
	private int age;
	
	public Person() {
		// TODO Auto-generated constructor stub
	}

	

	public Person(int pid, String name, int age) {
		super();
		this.pid = pid;
		this.name = name;
		this.age = age;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	@Override
	public String toString() {
		return "Person [pid=" + pid + ", name=" + name + ", age=" + age + "]";
	}

	
	
	
}
