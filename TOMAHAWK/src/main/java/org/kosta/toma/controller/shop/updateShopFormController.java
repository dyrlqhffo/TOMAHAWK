package org.kosta.toma.controller.shop;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.ShopDAO;

public class updateShopFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		long no=Long.parseLong(request.getParameter("shopNo"));
		request.setAttribute("post",ShopDAO.getInstance().findShopByNo(no));
		return "board/shop-update-form.jsp";
	}

}
