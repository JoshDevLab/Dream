package choi.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {
	
	
	// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다)
	boolean idDuplicateCheck(String userid) throws SQLException; 

	
	
}
