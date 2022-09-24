package jjy.login.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.*;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class LoginDAO implements InterLoginDAO {
	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;

	// 생성자
	public LoginDAO() {

		try {
			// connection pool 을 위한 작업
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("/jdbc/dream");

			aes = new AES256(SecretMyKey.KEY);// KEY는 스태틱 변수이기때문에 객체생성 필요 x
			// SecretMyKey.KEY 는 우리가 만든 비밀키이다.

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) { // key 가 16글자 미만인경우 발생하는 예외 처리
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {

		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} // end of try ~ catch()---------------------------------

	}

	/** 아이디(userid), 비밀번호(passwd) 를 paraMap 에 저장해 일치하는 사용자가 있는지 조회하는 메소드(select) */
	@Override
	public LoginDTO selectOneUser(Map<String, String> userinfoMap) throws SQLException {
		
		LoginDTO loginuser = null;

		try {
			
			conn = ds.getConnection();
			
			String sql = " select userid , passwd , secession , rest_member , update_passwd_date "
			           + " from tbl_member_login "
					   + " where userid =  ?  and passwd =  ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userinfoMap.get("userid"));
			pstmt.setString(2, userinfoMap.get("passwd"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				loginuser = new LoginDTO();
				
				loginuser.setUserid(rs.getString("userid"));
				loginuser.setPasswd(rs.getString("passwd"));
				loginuser.setSecession(rs.getString("secession"));
				loginuser.setRest_member(rs.getString("rest_member"));
				loginuser.setUpdate_passwd_date(rs.getString("update_passwd_date"));
				
			}
		} finally {
			close();
		}

		return loginuser;

	}// end of public LoginDTO selectOneUser(Map<String, String> userinfoMap) throws SQLException {}--------
}
