package kim.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {

	int updateCart(Map<String, String> paraMap) throws SQLException;

}
