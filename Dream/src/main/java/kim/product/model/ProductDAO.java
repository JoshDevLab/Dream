package kim.product.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kim.member.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class ProductDAO implements InterProductDAO {
	
	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 기본생성자
	public ProductDAO() {
		
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
	public ProductVO getDetail(String product_num) throws SQLException {
		
		ProductVO pvo = new ProductVO();

		try {
			 conn = ds.getConnection();
			
			 String sql = " select product_num, rigister_date, product_name, product_image, category, detail_category,price, "
			 		+ " discount_rate, gender, product_size, sale, product_cnt\n "+
					 " from tbl_product\n "+
					 " where product_num = 1 ";
			 
			 
			 int product_num_int = Integer.parseInt(product_num);
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setInt(1 , product_num_int);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 
				 pvo.setProduct_num(rs.getInt(1));
				 pvo.setRegister_date(rs.getString(2));
				 pvo.setProduct_name(rs.getString(3));
				 pvo.setProduct_image(rs.getString(4));
				 pvo.setCategory(rs.getString(5));
				 pvo.setDetail_category(rs.getString(6));
				 pvo.setPrice(rs.getInt(7));
				 pvo.setDiscount_rate(rs.getInt(8));
				 pvo.setGender(rs.getString(9));
				 pvo.setProduct_size(rs.getString(10));
				 pvo.setSale(rs.getInt(11));
				 pvo.setProduct_cnt(rs.getInt(12));
				 
			 }// end of while------------------------
			 
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("조져따리");
		} finally {
			close();
		}
		
		return pvo;
	}

}




