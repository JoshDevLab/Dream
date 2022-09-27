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
		    ds = (DataSource)envContext.lookup("jdbc/dream");
		    
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
		/*
		 * http://localhost:9090/Dream/product/detail.dream?num=2
		 */		
		ProductVO pvo = new ProductVO();
		
		try {
			
			 conn = ds.getConnection();
			 
			 String sql = " select product_num, register_date, product_name, product_image, "
			 		+ " category, detail_category, price, "
			 		+ " discount_rate, gender, product_content "+
					 " from tbl_product\n "+
					 " where product_num = ? ";
			 
			 System.out.println(product_num);
			 int product_num_int = Integer.parseInt(product_num);
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1 , product_num);
			 
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

				 // tbl_product_stock 테이블에서 사이즈, 재고 알아오기
				 String sql2 = " select product_num, product_size, size_cnt"+
						 " from tbl_product_stock "+
						" where product_num = ? ";
				 pstmt = conn.prepareStatement(sql2);
				 pstmt.setString(1 , product_num);
				 
				 System.out.println("product_num"+product_num);
				 
				 rs = pstmt.executeQuery();
				 List<String> sizeList = new ArrayList<>();
				 List<String> cntList = new ArrayList<>();
				 // 재고 VO 만들기 귀찮음 + 제품관련 호출할때마다 함수 두배로 만들기 힘드니 List 로 관리
				 while(rs.next()) {
					 sizeList.add(rs.getString(2));
					 cntList.add(rs.getString(3));
				 }
				 pvo.setProduct_size(sizeList); 
				 pvo.setProduct_cnt(cntList);
				 // 위 두 배열은 같은 인덱스 => 관계있는 값임
				 // index0 ==> size=s  cnt=20
				 // index1 ==> size=m  cnt=10
				 // index2 ==> size=l  cnt=40
				 
				 String sql3 = "  select count(*) "+
							" from tbl_like "+
							" where product_num =? ";

				    pstmt = conn.prepareStatement(sql3); 

					pstmt.setString(1,  product_num);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						pvo.setLikeCnt(rs.getInt(1));
					}
					else { //없는경우
						pvo.setLikeCnt(0);
					}
				 
				 
				 
			 }// end of while------------------------
			 
			 
			 
			 
			 
		} finally {
			close();
		}
		
		return pvo;
	}

	@Override
	public Map<String, ArrayList<String>> cnt_check(String productNum) throws SQLException {
		
		Map<String, ArrayList<String>> result = new HashMap<>();
		ArrayList<String> sizeArray = new ArrayList<>();
		ArrayList<String> cntArray = new ArrayList<>();
		System.out.println(productNum);
		
		try {
			
		
			conn = ds.getConnection();
			String sql = " select product_num, product_size, size_cnt "+
					"					 from tbl_product_stock "+
					"                 where product_num = ? "+
					"                 order by product_size asc ";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1 , productNum);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 sizeArray.add(rs.getString(2));
				 cntArray.add(rs.getString(3));

			 }
			 
			 result.put("size", sizeArray);
			 result.put("cnt", cntArray);

			 return result;
		} finally {
			
			close();
		}
		 
	}

}




