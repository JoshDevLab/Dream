<<<<<<< HEAD
package josh.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import josh.cart.model.*;

public class CartController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.setViewPage("/WEB-INF/view/cart/cart.jsp");
		
		if(super.checkLogin(request)) { // 로그인이 된 상태라면
			
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
				
			InterCartDAO mdao = new CartDAO();
			
			List<CartDTO> cartList = new ArrayList<>();
			
			cartList = mdao.selectCart(userid);
			
			request.setAttribute("cartList", cartList);
				
		}
		
	}
}
=======
package josh.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import josh.cart.model.*;

public class CartController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.setViewPage("/WEB-INF/view/cart/cart.jsp");
		
		if(super.checkLogin(request)) { // 로그인이 된 상태라면
			
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
				
			InterCartDAO mdao = new CartDAO();
			
			List<CartDTO> cartList = new ArrayList<>();
			
			cartList = mdao.selectCart(userid);
			
			request.setAttribute("cartList", cartList);
				
		}
		
	}
}
>>>>>>> refs/remotes/origin/josh2
