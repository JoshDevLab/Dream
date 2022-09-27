package hgb.address.model;

import java.sql.SQLException;
import java.util.*;





public interface InterAddressDAO {
	
	
	// 페이징 처리를 한 주소록 목록 보여주기
	List<AddressDTO> selectPagingAddress(Map<String, String> paraMap) throws SQLException;
	
	
	// 기본배송지를 셀렉트 해오는 메소드
	AddressDTO select_basic_address(String userid) throws SQLException;


	// 기본배송지가 아닌 주소들을 셀렉트 해오는 메소드
	List<AddressDTO> select_no_basic_address(String userid) throws SQLException;
	
	// 주소록을 등록해주는 메소드
	int registerAddress(AddressDTO address) throws SQLException;

}
