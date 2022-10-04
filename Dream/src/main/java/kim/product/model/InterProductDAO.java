package kim.product.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import kim.member.model.MemberVO;

public interface InterProductDAO {
	/** 제품상세 페이지에 들어가는 정보들 불러오기용 */ 
	ProductVO getDetail(String product_num) throws SQLException;
	
	/** 제품 번호 넢으면 재고수량 배열로 가져옴 */ 
	Map<String, ArrayList<String>> cnt_check(String productNum) throws SQLException;

	int nocartPurchaseUpdate(Map<String, String> paraMap) throws SQLException;

}
