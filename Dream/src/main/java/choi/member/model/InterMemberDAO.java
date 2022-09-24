package choi.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {
	
	
	// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다)
	boolean idDuplicateCheck(String userid) throws SQLException;

	
	// 맵에 회원 아이디와 비밀번호를 받아와서, 회원테이블과 회원로그인테이블에 insert를 해주는 메서드
	int memberJoin(Map<String, String> paraMap) throws SQLException;
	
}
