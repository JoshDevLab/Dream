package kim.member.model;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kim.member.model.InterMemberDAO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {
	
	
	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 기본생성자
	public MemberDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		    
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey.KEY 은 우리가 만든 비밀키이다.
		    
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}	
	
	
	
	

	@Override
	public int updateCart(Map<String, String> paraMap) throws SQLException{
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_member set pwd = ?, lastpwdchangedate = sysdate "
					   + " where userid = ? ";
			
			// update 이후 수량이 0개인 것만 delete 해야할듯 (트랜젝션 처리 필수)
			
			// 그런데 제품 즉시구매누르면 장바구니에 없기 때문에 장바구니에 즉시 추가되게 하거나
			// 아니면 장바구니 출신인지 기록해서 구분해서 sql 작성하거나
			
			// 구매 완료되면 tbl_buylist 에 그내용 그대로 추가해줘야함
			// 이거 select 해오고 그 값을 그대로 구매내역에 추가해줘야하는데
			// 나중에 얘기해보고 구매내역과 카트 합치는거 어떤지 제안
			
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Sha256.encrypt(paraMap.get("pwd")) ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시켜서 갱신해준다.
			pstmt.setString(2, paraMap.get("userid") );
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
		
	}

}
