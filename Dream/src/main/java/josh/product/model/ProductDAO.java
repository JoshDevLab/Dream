package josh.product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class ProductDAO implements InterProductDAO {

	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 생성자 
	public ProductDAO() {
		
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
	public int totalDiscount() throws SQLException {
		
		int totalDiscount = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) "
					   + " from tbl_product "
					   + " where discount_rate > 0 ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalDiscount = rs.getInt(1);
			
			
		} finally {
			close();
		}
		
		return totalDiscount;
	}

	@Override
	public List<ProductDTO> selectDiscountprd(Map<String, String> paraMap) throws SQLException{
		
		List<ProductDTO> discountList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select product_num, product_name, product_content, product_image, price, discount_rate, category "
					   + " from "
					   + " ( "
				       + " select row_number() over(order by discount_rate desc) AS rno, product_num, product_name, product_content, product_image, price, discount_rate, category "
					   + " from tbl_product "
					   + " where discount_rate > 0 "
					   + " ) "
					   + " where rno between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("start"));
			pstmt.setString(2, paraMap.get("end"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO pdto = new ProductDTO();
				pdto.setProduct_num(rs.getInt(1));
				pdto.setProduct_name(rs.getString(2));
				pdto.setProduct_content(rs.getString(3));
				pdto.setProduct_image(rs.getString(4));
				pdto.setPrice(rs.getInt(5));
				pdto.setDiscount_rate(rs.getFloat(6));
				pdto.setCategory(rs.getString(7));
				
				discountList.add(pdto);
			}
			
		} finally {
			close();
		}
		
		return discountList;
	}
	
	
}




























