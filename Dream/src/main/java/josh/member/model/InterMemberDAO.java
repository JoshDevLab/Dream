package josh.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {

	// 이메일이 중복되는지 확인하는 메소드
	boolean emailDuplicateCheck(String email) throws SQLException;

	// 멤버한명의 정보들을 가져오는 메소드 
	MemberDTO selectOne(String userid) throws SQLException;

}
