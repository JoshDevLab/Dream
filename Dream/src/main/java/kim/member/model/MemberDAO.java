package kim.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jjy.member.model.MemberDTO;
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
	public int updateCart(Map<String, String> paraMap) throws SQLException{
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_member set pwd = ?, lastpwdchangedate = sysdate "
					   + " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Sha256.encrypt(paraMap.get("pwd")) ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시켜서 갱신해준다.
			pstmt.setString(2, paraMap.get("userid") );
			
		
			
			result = pstmt.executeUpdate();
			
			
			
		} finally {
			close();
		}
		
		return result;
		
	}

	@Override
	public Map<String, String> likeCheck(Map<String, String> paraMap) throws SQLException {
		
		Map<String, String> resultMap = new HashMap<>();
		String resultType = "";
		String resultSuccess = "false";
		int n = 0;
		
		String userid = paraMap.get("userid");
		
		String productNum = paraMap.get("productNum");
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, product_num "+
					" from tbl_like "+
					" where userid= ? and product_num = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			System.out.println(userid+"/"+productNum);
			
			pstmt.setString(1, userid); 
			pstmt.setString(2,productNum );
			
			rs = pstmt.executeQuery();
			
			
	
			

			if(rs.next()) {
				
				sql = " delete from tbl_like "+
						" where userid = ?  and product_num = ? ";
//				System.out.println("좋아요있음");
				
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, userid); 
				pstmt.setString(2,productNum );

				n = pstmt.executeUpdate();
				if(n==1) {
//					System.out.println("좋아요삭제성공");
					resultType = "remove";
					resultSuccess = "true";
					
				}
				else {
//					System.out.println("좋아요삭제실패");
					resultType = "remove";
					resultSuccess = "false";
				}
				
				System.out.println(n);
				
			
				System.out.println(n);
			}
			 else {
//				 System.out.println("좋아요 없음");
				 sql = " insert into tbl_like(userid, product_num) "+
					   " values( ? , ?) ";
 
				    pstmt = conn.prepareStatement(sql); 

				    pstmt.setString(1, userid);
					pstmt.setString(2, productNum );
					 
					n = pstmt.executeUpdate();
					if(n==1) {
//						System.out.println("좋아요등록성공");
						resultType = "add";
						resultSuccess = "true";
					
					}
					else {
//						System.out.println("좋아요등록실패");
						resultType = "add";
						resultSuccess = "false";
					}

			
			 }
			
			
			resultMap.put("resultType", resultType);
			resultMap.put("resultSuccess", resultSuccess);
			
			// 좋아요 수 가져오기
			String sql2 = "  select count(*) "+
					" from tbl_like "+
					" where product_num =? ";

		    pstmt = conn.prepareStatement(sql2); 

			pstmt.setString(1, productNum );
			rs = pstmt.executeQuery();
			if(rs.next()) {
//				System.out.println("count" + rs.getString(1));
				resultMap.put("count", rs.getString(1));
			}
			else { //없는경우
				resultMap.put("count", "0");
			}
			return resultMap;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close();
			return resultMap;
		}
		

	}

	@Override
	public MemberVO pointCheck(String sessionUserid) throws SQLException {


		MemberVO mvo = new MemberVO();

		try {
			
			conn = ds.getConnection();
			String sql = " update tbl_point set status = '만료' "+
					"   where point_exp_period <=  sysdate" ;
			
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 포인트 업데이트가 성공하면
				
				// 여기서부터 포인트전까지 조쉬거 훔쳐옴
				conn = ds.getConnection();
				
				sql = " select A.userid, mobile, username, membership\n"
						    + " from\n"
						    + " (\n"
							+ " select userid, mobile, username, membership\n"
							+ " from tbl_member\n"
							+ " )A\n"
							+ " join\n"
							+ " (\n"
							+ " select userid, passwd\n"
							+ " from tbl_member_login\n"
							+ " )B\n"
							+ " on A.userid = B.userid\n"
							+ " where A.userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, sessionUserid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					mvo.setUserid(rs.getString(1));
					mvo.setMobile(rs.getString(2));
					mvo.setUsername(rs.getString(3));
					mvo.setMembership(rs.getInt(4));
				}
				
				// 포인트
				
				conn = ds.getConnection();
				
				String sql2 = " SELECT SUM(CASE WHEN  status = '적립' THEN point_amount "+
						"        WHEN  status = '차감' THEN -point_amount "+
						"        else 0 END) "+
						" FROM tbl_point "+
						" where userid = ? ";
				
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, sessionUserid); // 세션 아이디값

				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 내역 없어도 sum 이라 한행이 나옴
					// 근데 내역이 하나도 없으면 null 나옴
					
					if( rs.getString(1) != null) {
						// 내역이 존재한 경우에는 총합값을 저장
						mvo.setPoint(rs.getInt(1));
					}
					else {
						// 내역이 없는 경우에는 0 을 저장
						mvo.setPoint(0);
					}
					
				}
			}

			
			
		} finally {
			close();
		}
		
		return mvo;
		
		
		
	}



}
