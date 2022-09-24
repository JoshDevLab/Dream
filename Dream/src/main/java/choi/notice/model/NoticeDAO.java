package choi.notice.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class NoticeDAO implements InterNoticeDAO{
	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 생성자 
	public NoticeDAO() {
		
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
			
			
			
			
	// 모든 게시글들을 셀렉트 해오는 메소드
	@Override
	public List<NoticeDTO> selectAllNotice() throws SQLException{
		List<NoticeDTO> noticeList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = "select notice_num "
					   + " ,notice_title "
					   + " ,to_char(write_date,'yy-mm-dd hh:mi') write_date "
					   + " from  "
					   + " ( "
					   + " select rownum R,notice_num,notice_title,write_date "
					   + " from tbl_notice "
					   + " )A  "
					   + " where R between 1*10-9 and 1*10 "
					   + " order by notice_num desc ";
			
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(,);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO ndto = new NoticeDTO();
				ndto.setNotice_num(rs.getInt("NOTICE_NUM"));
				ndto.setNotice_title(rs.getString("NOTICE_TITLE"));;
				
				noticeList.add(ndto);
			}
		} finally {
			close();
		}
		return noticeList;
	}//end of public List<NoticeDTO> selectAllNotice() {}----
	
	
	//글번호를 입력받아서 한개의 글을 select 하는 메소드
	@Override
	public NoticeDTO select_one_notice(int notice_num) throws SQLException{
		NoticeDTO ndto = null;
		try {
			conn = ds.getConnection();
			
			String sql =  " select notice_title "
						+ "      , notice_content "
						+ "      , to_char(write_date,'yy-mm-dd') write_date "
						+ " from tbl_notice "
						+ " where notice_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,notice_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ndto = new NoticeDTO();
				
				ndto.setNotice_title(rs.getString("notice_title"));
				ndto.setNotice_content(rs.getString("notice_content"));
				ndto.setWrite_date(rs.getString("write_date"));
			}
		} finally {
			close();
		}
		return ndto;
		
	}//end of public void select_one_notice(int notice_num)------
}
