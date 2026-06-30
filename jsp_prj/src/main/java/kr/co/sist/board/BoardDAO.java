package kr.co.sist.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.GetConnection;
import kr.co.sist.user.member.MemberDTO;

public class BoardDAO {
	private static BoardDAO mpDAO;
	private BoardDAO() {
	}//MyPageDAO
	
	public static BoardDAO getInstance() {
		if(mpDAO == null) {
			mpDAO=new BoardDAO();
		}//end if
		return mpDAO;
	}//getInstance
	
	public MemberDTO selectUserInfo(String id) throws SQLException {
		MemberDTO mDTO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		GetConnection gc=GetConnection.getInstance();
		
		try {
			//커넥션 얻기
			con=gc.getConn("dbcp");
			//쿼리문 수행 객체 얻기
			String selectId=
			"select name,email,phone,zipcode,address,address2,profile,ip,inputdate from web_member where id=?";
			pstmt=con.prepareStatement(selectId);
			//바인드 변수에 값 설정
			pstmt.setString(1,id);
			//쿼리문 실행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mDTO=new MemberDTO();
				mDTO.setId(id);
				mDTO.setName(rs.getString("name"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setZipcode(rs.getString("zipcode"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setAddress2(rs.getString("address2"));
				mDTO.setProfile(rs.getString("profile"));
				mDTO.setIp(rs.getString("ip"));
				mDTO.setInputDate(rs.getDate("inputdate"));
			}//end if
		}finally {
			gc.dbClose(rs, pstmt, con);
		}//end finally
		
		return mDTO;
	}//selectUserInfo
	
}//class
