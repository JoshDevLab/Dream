package jjy.purchase.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jjy.product.model.ProductDTO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class PurchaseListDAO implements InterPurchaseListDAO {

	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;

	// 생성자
	public PurchaseListDAO() {

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

	@Override
	public List<PurchaseListDTO> allPurchaseList(Map<String, String> purchaseMap)throws SQLException {

		List<PurchaseListDTO> purchaseList = new ArrayList<>();

		try {
			conn = ds.getConnection();
			
//			System.out.println("확인용 : "+purchaseMap.get("userid"));
//			System.out.println("확인용 : "+purchaseMap.get("input_shipping"));
//			System.out.println("확인용 : "+purchaseMap.get("start_date"));
//			System.out.println("확인용 : "+purchaseMap.get("end_date"));
//			System.out.println("확인용 : "+purchaseMap.get("sort"));
			
			
			String sql = " select order_num, userid, B.product_num, buy_cnt , buy_date , shipping, product_name, product_image "+
					     " from tbl_buylist B left join tbl_product P "+
					     " on B.product_num = P.product_num "+
					     " where userid = ? and shipping = ? "+
					     " and buy_date between TO_DATE( ?  , 'YYYY/MM/DD') AND TO_DATE( ? , 'YYYY/MM/DD') "+
					     " order by buy_date "+purchaseMap.get("sort");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, purchaseMap.get("userid"));
			pstmt.setString(2, purchaseMap.get("input_shipping") );
			pstmt.setString(3, purchaseMap.get("end_date") );
			pstmt.setString(4, purchaseMap.get("start_date") );
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 한 회원의 정보를 담을 객체 생성
				PurchaseListDTO pdto = new PurchaseListDTO();

				pdto.setOrder_num(rs.getInt("order_num") );     	  // 일련번호
				pdto.setUserid(rs.getString("userid"));         	  // 주문자 아이디
				pdto.setProduct_num(rs.getInt("product_num"));  	  // 주문 제품
				pdto.setBuy_cnt(rs.getInt("buy_cnt"));          	  // 구매 수량
				pdto.setBuy_date(rs.getString("buy_date"));     	  // 구매날짜
				pdto.setShipping(rs.getInt("shipping"));              // 배송상태
				
				ProductDTO prodDTO = new ProductDTO();				  //ProductDTO에 있는 제품이름, 제품이미지 저장
				prodDTO.setProduct_name(rs.getString("product_name")); // 제품이름
				prodDTO.setProduct_image(rs.getString("product_image"));// 제품이미지
				pdto.setProdDTO(prodDTO);
				
				
				purchaseList.add(pdto);
//				System.out.println("확인용 prdoDTO name : "+prodDTO.getProduct_name());
//				System.out.println("확인용 prdoDTO image :"+prodDTO.getProduct_image());
			}
		} finally {
			close();
		}

		return purchaseList;

	}

}
