package day0623;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ForEachService {
	
	public String[] subjectArr() {
		String[] subject = {"Java SE","C/C++","PyThon","PHP","JavaScript"};
		return subject;
	}//subjectArr
	
	public List<String> subjectList() {
		List<String> subject = new ArrayList<String>();
		subject.add("Java SE");
		subject.add("C/C++");
		subject.add("PyThon");
		subject.add("PHP");
		subject.add("JavaScript");
		return subject;
	}//subjectList
	
	public List<UserDTO2> searchUser(){
		List<UserDTO2> list=new ArrayList<UserDTO2>();
		if(new Random().nextBoolean()) {
			list.add(new UserDTO2("테스트", "test@test.com", 25));
			list.add(new UserDTO2("테스트2", "test2@test.com", 26));
			list.add(new UserDTO2("테스트3", "test4@test.com", 27));
			list.add(new UserDTO2("테스트4", "test5@test.com", 25));
		}//end if
		return list;
	}
}
