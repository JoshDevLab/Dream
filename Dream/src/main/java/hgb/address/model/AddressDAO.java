package hgb.address.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;


public class AddressDAO implements InterAddressDAO {
	// DBCP
			private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
			private Connection conn;
			private PreparedStatement pstmt;
			private ResultSet rs;
			private AES256 aes;

			// 생성자
			public AddressDAO() {

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
			
			
			
			
			
			// 주소록을 등록해주는 메소드
			@Override
			public int registerAddress(AddressDTO address1) throws SQLException {
				
				int result = 0;
				
				
				try {
					conn = ds.getConnection();
					
					String sql = " insert into tbl_address (address_num,userid,basic_address,address,detail_address,post_code,order_name,mobile) "
							   + " values (seq_address_num.nextval,'josh@gmail.com','0',?,?,?,?,?) ";
							   
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, address1.getAddress());
					pstmt.setString(2, address1.getDetail_address());	
					pstmt.setString(3, address1.getPost_code());	
					pstmt.setString(4, address1.getOrder_name());
					pstmt.setString(5, address1.getMobile());    // 암호를 SHA256 알고리즘으르 단방향 암호화 시킨다.  
								
					
					result = pstmt.executeUpdate();
					
				} catch(SQLException e) {
					e.printStackTrace();
				} finally {
					close();
				}
				
				
				
				return result;
			}// end of public int registerAddress(AddressDTO address) throws SQLException --------------------------

			
						
						
						
		
			
			  // 기본배송지를 셀렉트 해오는 메소드
			  
			  @Override public AddressDTO select_basic_address(String userid) throws SQLException{
			  
			  AddressDTO adto = null; 
			  
			  try { 
				  conn = ds.getConnection();
			  
			      String sql = " select * from tbl_address " 
			                 + " where userid = ? and basic_address = 0 ";
				  
				  pstmt = conn.prepareStatement(sql); pstmt.setString(1,userid);
				  
				  rs = pstmt.executeQuery();
				  
				  if(rs.next()) {
					  
				  adto = new AddressDTO();
				  
				  adto.setAddress(rs.getString("ADDRESS"));
				  adto.setDetail_address(rs.getString("DETAIL_ADDRESS"));
				  adto.setMobile(rs.getString("MOBILE"));
				  adto.setOrder_name(rs.getString("ORDER_NAME"));
				  adto.setPost_code(rs.getString("POST_CODE")); }// end of if
				  
				  
				  } finally {
					  close(); 
				  } return adto;
				  
			  }
			  
			  
			  

			@Override
			public List<AddressDTO> selectAddress(String userid) throws SQLException{
				
				AddressDTO adto = null; 
				
				List<AddressDTO> addressList = new ArrayList<>();
				
				try { 
					
					conn = ds.getConnection();
				
				 
				  String sql = " select * from tbl_address "
				             + " where userid = ? and basic_address = '0' " + " order by address_num ";
				  
				  pstmt = conn.prepareStatement(sql); 
				  pstmt.setString(1,userid);
				  
				  
				  rs = pstmt.executeQuery();
				  
				  while(rs.next()) {
					  
				  adto = new AddressDTO();
				  
				  adto.setAddress(rs.getString("ADDRESS"));
				  adto.setDetail_address(rs.getString("DETAIL_ADDRESS"));
				  adto.setMobile(rs.getString("MOBILE"));				
				  adto.setOrder_name(rs.getString("ORDER_NAME"));
				  adto.setPost_code(rs.getString("POST_CODE")); 

				  addressList.add(adto);
				  
				  }// end of if
				
				  
				  
				  
			} finally {
				  close(); 
			  } return addressList;
			 
			
			
			}	
			

			
			
			
			
			/*
			 * // 기본배송지가 아닌 주소들을 셀렉트 해오는 메소드
			 * 
			 * @Override public List<AddressDTO> no_selectPagingMember(Map<String, String>
			 * paraMap) throws SQLException{
			 * 
			 * List<AddressDTO> adressList = new ArrayList<>();
			 * 
			 * AddressDTO adto = null; try { conn = ds.getConnection();
			 * 
			 * String sql = " select * from tbl_address " +
			 * " where userid = ? and basic_address = '0' " + " order by address_num ";
			 * 
			 * 
			 * pstmt = conn.prepareStatement(sql); pstmt.setString(1,);
			 * 
			 * // pstmt.setInt(1,); // 공식
			 * 
			 * rs = pstmt.executeQuery();
			 * 
			 * adressList = new ArrayList<>();
			 * 
			 * if(rs.next()) {
			 * 
			 * adto = new AddressDTO();
			 * 
			 * adto.setAddress(rs.getString("ADDRESS"));
			 * adto.setDetail_address(rs.getString("DETAIL_ADDRESS"));
			 * adto.setMobile(rs.getString("MOBILE"));
			 * adto.setOrder_name(rs.getString("ORDER_NAME"));
			 * adto.setPost_code(rs.getString("POST_CODE"));
			 * 
			 * adressList.add(adto);
			 * 
			 * }// end of if
			 * 
			 * } finally { close(); }
			 * 
			 * 
			 * return adto; }
			 */
			
			
			
			
			
			
			
			
			
			
			
			
}
