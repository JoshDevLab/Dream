package josh.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import josh.cart.model.CartDAO;
import josh.cart.model.InterCartDAO;

public class CartDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cart_num = request.getParameter("cart_num");
		
		InterCartDAO cdao = new CartDAO();
		
		int n = cdao.cartSelectDelete(cart_num);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("n", n);
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/joshJsonview.jsp");
		
	}

}
