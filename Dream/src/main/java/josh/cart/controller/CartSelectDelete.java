package josh.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import josh.cart.model.CartDAO;
import josh.cart.model.InterCartDAO;

public class CartSelectDelete extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int n = 0;
		
		String jsonData = request.getParameter("jsonData");
		 
		// System.out.println("확인용 jsonData ==> " + jsonData);
		 
		JSONObject jsonObj = new JSONObject();
		
		JSONArray deleteArray = new JSONArray(jsonData);
		
		for(Object obj : deleteArray) {
			
			jsonObj = (JSONObject)obj;
						
			String cart_num = (String) ( jsonObj.get("cart_num") );
			
			InterCartDAO cdao = new CartDAO();
			
			n += cdao.cartSelectDelete(cart_num);
			
		}
		
		jsonObj.put("n", n);
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/joshJsonview.jsp");
	}

	
	
}














