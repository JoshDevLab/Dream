package choi.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	//필터에 맞는 총 게시물 수를 알아오는 메소드
	int cntAllProduct(Map<String,String> paraMap) throws SQLException;
	
	
	//페이징처리를해서, 제품들을 셀렉트해오는 메소드
	List<ProductDTO> selectAllProduct(Map<String, String> paraMap) throws SQLException;

}
