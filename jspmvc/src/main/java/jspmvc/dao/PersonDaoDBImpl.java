package jspmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jspmvc.util.ConnectionUtil;
import jspmvc.vo.Person;

public class PersonDaoDBImpl implements PersonDao{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public List<Person> listPerson(List<Person> personList) throws Exception {
		conn= ConnectionUtil.getConnection();
		String sql = "select * from person order by pid desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		personList = new ArrayList<Person>();
		while(rs.next()) {
			Person person = new Person(
					rs.getInt("pid"),
					rs.getString("name"),
					rs.getInt("age")
					);
			personList.add(person);
		}
		return personList;
	}

	@Override
	public Person getPerson(List<Person> personList, int pid) throws Exception {
	    conn = ConnectionUtil.getConnection();
	    String sql = "SELECT * FROM person WHERE pid = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, pid);
	    rs = pstmt.executeQuery();
	    
	    // 만약 데이터베이스에서 해당 pid를 찾았다면 Person 객체를 반환합니다.
	    if (rs.next()) {
	        int dbPid = rs.getInt("pid");
	        String name = rs.getString("name");
	        int age = rs.getInt("age");
	        
	        // 데이터베이스 결과를 이용하여 Person 객체를 반환합니다.
	        Person dbPerson = new Person(dbPid, name, age);
	        return dbPerson;
	    }
	    
	    // pid를 찾지 못한 경우 null을 반환합니다.
	    return null;
	}

	@Override
	public List<Person> registPerson(List<Person> personList, Person person) throws Exception {
		conn = ConnectionUtil.getConnection();
		String sql = "insert into person values(seq_person.nextval,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, person.getName());
		pstmt.setInt(2, person.getAge());
		pstmt.executeUpdate();
		personList.add(person);
		return personList;
	}

	@Override
	public List<Person> updatePerson(List<Person> personList, Person personBefore, Person personAfter)
			throws Exception {
		conn = ConnectionUtil.getConnection();
		String sql = "update person set name=?, age=? where pid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, personAfter.getName());
		pstmt.setInt(2, personAfter.getAge());
		pstmt.setInt(3, personAfter.getPid());
		pstmt.executeUpdate();
		personList.remove(personBefore);
		personList.add(personAfter);
		return personList;
	}

	@Override
	public List<Person> deletePerson(List<Person> personList, int pid) throws Exception {
		conn = ConnectionUtil.getConnection();
		String sql = " delete person where pid=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pid);
		pstmt.executeUpdate();
//		personList.remove(getPerson(personList, pid));
		Person removePerson = null;
		for (Person person : personList) {
			if (person.getPid() == pid) {
				removePerson = person ;
			}
		}
		personList.remove(removePerson);
		return personList;
	}

}
