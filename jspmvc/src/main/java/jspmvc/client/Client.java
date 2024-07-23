package jspmvc.client;

import java.util.ArrayList;
import java.util.List;

import jspmvc.dao.PersonDaoDBImpl;
import jspmvc.dao.PersonDaoImpl;
import jspmvc.service.PersonService;
import jspmvc.vo.Person;

public class Client {
	
	private static PersonService personService;
	private static List<Person> personList;
	public static void main(String[] args) throws Exception {
//		personService = new PersonDaoImpl();
		personService = new PersonDaoDBImpl();
		personList = new ArrayList<Person>();
		
		//regist
//		Person person = new Person(1,"홍길동",20);
//		personService.registPerson(personList,person);
//		person = new Person(2,"이순신",30);
//		personService.registPerson(personList,person);
//		person = new Person(3,"강감찬",40);
//		personService.registPerson(personList,person);
//		System.out.println(personList);
		
//		//list
//		personList = personService.listPerson(personList);
//		System.out.println(personList);
//		
//		//update
		
//		Person personBefore = new Person(3,"강감찬",40);
//		Person personAfter = new Person(3,"강감찬변경",50);
//		personList = personService.updatePerson(personList,personBefore,personAfter);
//		System.out.println(personList);
		
		//delete
//		personService.deletePerson(personList, 3);
//		System.out.println(personList);
		
//		Person foundPerson = personService.getPerson(personList, 2);
//        System.out.println("찾은 사람: " + foundPerson);
	}//main
}//class
