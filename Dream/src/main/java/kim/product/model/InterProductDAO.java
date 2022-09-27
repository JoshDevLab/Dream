package kim.product.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import kim.member.model.MemberVO;

public interface InterProductDAO {

	ProductVO getDetail(String product_num) throws SQLException;

	Map<String, ArrayList<String>> cnt_check(String productNum) throws SQLException;

}
