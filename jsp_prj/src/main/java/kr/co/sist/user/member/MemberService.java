package kr.co.sist.user.member;

import java.sql.SQLException;

public class MemberService {

	/**
	 * 아이디 중복 확인
	 * @param id 입력되는 아이디
	 * @return true-아이디가 존재, false-아이디가 없는 경우
	 */
	public boolean searchDupId(String id) {
		boolean idFlag=false;
		
		MemberDAO mDAO=MemberDAO.getInstance();
		try {
			idFlag=mDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return idFlag;
	}//searchDupId
	
   public boolean addMember(MemberDTO mDTO) {
      
      boolean flag=false;
      //DAO클래스를 사용하여 DB 추가작업 수행
      
      flag=true;
      
      return flag;
      
   }//addMember
   
}//class
