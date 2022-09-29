package josh.member.model;

import java.io.UnsupportedEncodingException;
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

import josh.purchase.model.PurchaseListDTO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

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
		public boolean mobileDuplicateCheck(String mobile) throws SQLException{
			
			boolean isExists = false;
			
			try {
			
				conn = ds.getConnection();
				
				String sql = " select mobile "
						   + " from tbl_member "
						   + " where mobile = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mobile);
				
				rs = pstmt.executeQuery();
				
				isExists = rs.next(); // 행이 있으면(중복된 email) true ,
				                      // 행이 없으면(사용가능한 email) false 
				
			} finally {
				close();
			}
				
			return isExists;
		}

		// 멤버한명의 정보들을 select 해오는 메소드
		@Override
		public MemberDTO selectOne(String userid) throws SQLException {
			
			MemberDTO mdto = new MemberDTO();
			
			try {
				conn = ds.getConnection();
				
				String sql = " select A.userid, mobile, username, passwd, point, membership "
						    + " from "
						    + " ( "
							+ " select userid, mobile, username, point, membership "
							+ " from tbl_member "
							+ " )A "
							+ " join "
							+ " ( "
							+ " select userid, passwd "
							+ " from tbl_member_login "
							+ " )B "
							+ " on A.userid = B.userid "
							+ " where A.userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					mdto.setUserid(rs.getString(1));
					mdto.setMobile(rs.getString(2));
					mdto.setUsername(rs.getString(3));
					mdto.setPasswd(rs.getString(4));
					mdto.setPoint(rs.getInt(5));
					mdto.setMembership(rs.getInt(6));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return mdto;
		}

		
		// 멤버 개인정보 수정하는 메소드
		@Override
		public int updateInfo(Map<String, String> paraMap) throws SQLException {
			int n = 0;
			
			//System.out.println("dao에 넘어옴");
			
			int passwd_store_cnt = Integer.parseInt(paraMap.get("passwd_store_cnt"));
			int mobile_store_cnt = Integer.parseInt(paraMap.get("mobile_store_cnt"));
			// System.out.println("passwd_store_cnt 확인용 >>> "+ passwd_store_cnt );
			//System.out.println("userid_store_cnt 확인용 >>> "+ userid_store_cnt );
			
			try {
				
				conn = ds.getConnection();
				
				String sql = " update tbl_member set userid = ?, username = ?, mobile = ?"
						   + " where userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setString(2, paraMap.get("username"));
				pstmt.setString(3, paraMap.get("mobile"));
				pstmt.setString(4, paraMap.get("userid"));
				//pstmt.setString(4, paraMap.get("sessionUserid"));
				
				n = pstmt.executeUpdate();
				
				
				if(passwd_store_cnt > 0 || mobile_store_cnt > 0) {
					sql = " update tbl_member_login set passwd = ? "
						+ " where userid = ? ";
						
					pstmt = conn.prepareStatement(sql);
						
					pstmt.setString(1, Sha256.encrypt(paraMap.get("passwd")));
					pstmt.setString(2, paraMap.get("userid"));
					
					n = pstmt.executeUpdate();
					//System.out.println("확인용!!!!!!! 두번째 꺼 ==> "+n);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			
			
			return n;
		}

		// 마이페이지 진입할때 로그인한 회원의 정보
		@Override
		public HashMap<String, Integer> shippingCnt(String userid) throws SQLException {
			
			HashMap<String, Integer> map = new HashMap<>();
			
			try {
				conn = ds.getConnection();
				
				String sql = " select shipping, count(*) as count "
							+ " from tbl_member m join tbl_buylist b "
							+ " on m.userid = b.userid "
							+ " where m.userid = ? and shipping between '0' and '2' "
							+ " group by shipping "
							+ " order by shipping asc ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {

					if(rs.getInt(1) == 0) {
						map.put("shipping_ready", rs.getInt(2));
					}
					if(rs.getInt(1) == 1) {
						map.put("shipping_now", rs.getInt(2));
					}
					if(rs.getInt(1) == 2) {
						map.put("shipping_end", rs.getInt(2));
					}
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return map;
		}
}


























