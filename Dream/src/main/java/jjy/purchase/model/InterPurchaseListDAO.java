package jjy.purchase.model;

import java.sql.SQLException;
import java.util.*;

public interface InterPurchaseListDAO {

	/** userid 를 입력받아 모든 구매내역을 List 타입으로 반환하는 메소드 */
	List<PurchaseListDTO> allPurchaseList(Map<String, String> purchaseMap) throws SQLException;

	/** 사용자 아이디, 시작일, 종료일, 배송상태를 Map으로 전달받아 출력해야 할 페이지 수를 구해오는 메소드 (select) */
	int getTotalPage(Map<String, String> purchaseMap) throws SQLException;

	/** 페이징처리를 위한 구매내역 조회하기 */
	List<PurchaseListDTO> selectPagingPurchaseList(Map<String, String> purchaseMap)throws SQLException ;

	/** 출력해야 할 구매내역 수 조회하기 */
	int getTotalListCnt(Map<String, String> purchaseMap)throws SQLException ;



	
}
