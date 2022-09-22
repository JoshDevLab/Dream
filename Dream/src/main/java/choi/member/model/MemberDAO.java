package choi.member.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class MemberDAO implements InterMemberDAO{
	// DBCP
			private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
			private Connection conn;
			private PreparedStatement pstmt;
			private ResultSet rs;
			private AES256 aes;
			
			
			// 생성자 
			public MemberDAO() {
				
				try {
					// connection pool 을 위한 작업
					Context initContext = new InitialContext();
					Context envContext  = (Context)initContext.lookup("java:/comp/env");
					ds = (DataSource)envContext.lookup("/jdbc/dream");
					
					aes = new AES256(SecretMyKey.KEY);// KEY는 스태틱 변수이기때문에 객체생성 필요 x
					// SecretMyKey.KEY 는 우리가 만든 비밀키이다.
					
				} catch(NamingException e) {
					e.printStackTrace();
				} catch(UnsupportedEncodingException e) { // key 가 16글자 미만인경우 발생하는 예외 처리
					e.printStackTrace();
				}
			}
			
			// 사용한 자원을 반납하는 close() 메소드 생성하기
			private void close() {
				
				try {
					if(rs != null)    { rs.close();    rs = null; }
					if(pstmt != null) { pstmt.close(); pstmt = null; }
					if(conn != null)  { conn.close();  conn = null; }
				}catch(SQLException e){
					e.printStackTrace();
				}// end of try ~ catch()---------------------------------
				
			}

			@Override
			// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다)
			public boolean idDuplicateCheck(String userid) throws SQLException{
				boolean isExists = false;
				
				try {
					
					conn = ds.getConnection();
					
					String sql = " select userid "
							   + " from tbl_member_login "
							   + " where userid = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userid);
					
					rs = pstmt.executeQuery();
					
					isExists = rs.next(); // 행이 있으면 (중복된 userid) true, 
										  // 행이 없으면 (사용가능한 userid) false  
					
				} finally {
					close();
				}
				
				return isExists;
			}
}
