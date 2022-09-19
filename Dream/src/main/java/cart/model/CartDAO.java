package cart.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Map;

import javax.naming.*;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class CartDAO implements InterCartDAO{
	// DBCP
		private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private AES256 aes;
		
		
		// 생성자 
		public CartDAO() {
			
			try {
				// connection pool 을 위한 작업
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/myoracle");
				
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
}
