package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

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
      MemberDAO mDAO=MemberDAO.getInstance();
      try {
    	  
    	  //일방향해시 : 비밀번호
    	  mDTO.setPassword(DataEncryption.messageDigest("SHA-1", mDTO.getPassword()));
    	  //암호화 : 이름, 이메일, 전화번호
    	  String key="a012345678912345";
    	  DataEncryption de=new DataEncryption(key);
    	  mDTO.setName(de.encrypt(mDTO.getName()));
    	  mDTO.setEmail(de.encrypt(mDTO.getEmail()));
    	  mDTO.setPhone1(de.encrypt(mDTO.getEmail()));
    	  mDTO.setPhone(de.encrypt(mDTO.getPhone1()+"-"+mDTO.getPhone2()+"-"
    			  			+mDTO.getPhone3()));
    	  
    	  mDAO.insertWebMember(mDTO);
    	  flag=true;//취미가 실패하더라도 true 반환
    	  if(mDTO.getHobby() != null) { //취미가 있다면
    		  mDAO.insertWebMemberHobby(mDTO);
    	  }//end if
      } catch (SQLException e) {
		e.printStackTrace();
      } catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
      } catch (Exception e) {
		e.printStackTrace();
      }//end catch
      
      return flag;
   }//addMember
   
}//class
