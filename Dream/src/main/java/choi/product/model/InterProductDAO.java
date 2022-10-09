package choi.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	//필터에 맞는 총 게시물 수를 알아오는 메소드
	int cntAllProduct(Map<String,String> paraMap) throws SQLException;
	
	
	//페이징처리를해서, 제품들을 셀렉트해오는 메소드
	List<ProductDTO> selectAllProduct(Map<String, String> paraMap) throws SQLException;

	// 키워드를 입력받아서, 키워드로 검색한 총게시물의 수를 알아오는 메소드
	int cntkeywordProduct(String keyword) throws SQLException;
	
	
	
	// 키워드,페이지번호,한페이지당 보여줄 게시물수,유저아이디를 맵으로 입력받아서, 키워드로 검색한 게시물의 리스트들을 받아오는 메소드
	List<ProductDTO> selectKeywordProduct(Map<String, String> paraMap) throws SQLException;

}
