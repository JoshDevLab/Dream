package josh.member.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import josh.cart.model.CartDTO;
import josh.purchase.model.PurchaseListDTO;

public interface InterMemberDAO {

	// 전화번호가 중복되는지 확인하는 메소드
	boolean mobileDuplicateCheck(String mobile) throws SQLException;

	// 멤버한명의 정보들을 가져오는 메소드 
	MemberDTO selectOne(String userid) throws SQLException;

	// 멤버 개인정보 수정하는 메소드
	int updateInfo(Map<String, String> paraMap) throws SQLException;

	// 마이페이지 진입할때 로그인한 회원의 정보
	HashMap<String, Integer> shippingCnt(String userid) throws SQLException;


}
