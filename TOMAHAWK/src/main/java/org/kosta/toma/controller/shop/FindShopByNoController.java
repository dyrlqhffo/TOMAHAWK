package org.kosta.toma.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BookmarkDAO;
import org.kosta.toma.model.dao.ShopDAO;

public class FindShopByNoController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		long no=Long.parseLong(request.getParameter("no"));
		String sessionEmail = (String) session.getAttribute("sessionEmail");
		request.setAttribute("bookmark", BookmarkDAO.getInstance().findBookmarkForShop(sessionEmail));
		request.setAttribute("shop", ShopDAO.getInstance().findShopByNo(no));
		return "board/shop-detail.jsp";
	}
}
