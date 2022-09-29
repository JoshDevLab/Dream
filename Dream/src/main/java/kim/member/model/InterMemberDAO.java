package kim.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {
	/** 뭐였드라 하여튼 만들라다가 만들필요없어서 안만듬 */
	int updateCart(Map<String, String> paraMap) throws SQLException;
	/** 좋아요 수 파악후 내가 안눌렀다면 추가, 눌렀다면 삭제 */
	Map<String, String> likeCheck(Map<String, String> paraMap) throws SQLException;
    /** userid 로 포인트 가져오기 
     * @param sessionUserid */
	MemberVO pointCheck(String sessionUserid) throws SQLException;

}
