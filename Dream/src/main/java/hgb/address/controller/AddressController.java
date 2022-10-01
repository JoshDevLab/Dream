package hgb.address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hgb.address.model.AddressDAO;
import hgb.address.model.AddressDTO;
import hgb.address.model.InterAddressDAO;



public class AddressController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {	//method가 "POST" 일 때
						
			
		}
		
		else {	//method가 "GET"일 때 
			HttpSession session = request.getSession();
			
			//로그인 중인 사람의 userid 값 가져오기
//			String userid = (String)session.getAttribute("userid");
			String userid = "josh@gmail.com";
			
			
			// 기본배송지 하나 가져오기(한개)
			InterAddressDAO adao = new AddressDAO();
			
			
			
			List<AddressDTO> addressList = adao.selectAddress(userid);
			
			AddressDTO basic_adto = adao.select_basic_address(userid);
			AddressDTO address_num = adao.select_basic_address(userid);
			String basic_mobile = basic_adto.getMobile();
			
			
			
			//전화번호를 첫번째자리 3자리, 두번째자리 4자리, 세번째자리 4자리 
//			01074239713
			String basic_first_mobile = basic_mobile.substring(0,3);
			String basic_second_mobile = basic_mobile.substring(3,4) + "***";
			String basic_third_mobile = basic_mobile.substring(7,8) + "***";
			
			request.setAttribute("addressList", addressList);
				
			request.setAttribute("basic_first_mobile", basic_first_mobile);
			request.setAttribute("basic_second_mobile", basic_second_mobile);
			request.setAttribute("basic_third_mobile", basic_third_mobile);
			request.setAttribute("basic_adto", basic_adto);		
			request.setAttribute("address_num", address_num);
			
			
			// 기본배송지가 아닌것들 가져오기(여러개) 여러개니까 리스트로 가져오는데, 리스트 안에 들어가는것은 AddressDTO
//			List<AddressDTO> adressList = adao.select_no_basic_address(userid);
			
//			나온 값을
//			request에 담아서
			
			
			
			
			
			
			
			super.setViewPage("/WEB-INF/view/member/address.jsp");
		}
		
	}		
}


