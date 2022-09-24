package kim.product.model;

import java.sql.SQLException;
import java.util.Map;

import kim.member.model.MemberVO;

public interface InterProductDAO {

	ProductVO getDetail(String product_num) throws SQLException;

}
