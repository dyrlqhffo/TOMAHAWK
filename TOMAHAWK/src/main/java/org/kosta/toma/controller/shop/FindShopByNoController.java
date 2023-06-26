package org.kosta.toma.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.ShopDAO;

public class FindShopByNoController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		long no=Long.parseLong(request.getParameter("no"));
		//게시물 조회
		request.setAttribute("shop", ShopDAO.getInstance().findShopByNo(no));
		return "board/shop-detail.jsp";
	}
}
