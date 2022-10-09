package hgb.member.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import hgb.member.model.MemberDTO;


public interface InterMemberDAO {


	// 회원한명의 상세정보를 보여주는 메소드
	MemberDTO memberOneDetail(String userid) throws SQLException;
	
	
}
