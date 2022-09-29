package hgb.address.model;

import java.sql.SQLException;
import java.util.*;





public interface InterAddressDAO {
	
	
	
	
	
	
	 // 기본배송지를 셀렉트 해오는 메소드 
	   AddressDTO select_basic_address(String userid) throws SQLException;
	 
	
	
	// 주소록을 등록해주는 메소드
	int registerAddress(AddressDTO address) throws SQLException;



	List<AddressDTO> selectAddress(String userid) throws SQLException;
	
	

	


	
	 
}
