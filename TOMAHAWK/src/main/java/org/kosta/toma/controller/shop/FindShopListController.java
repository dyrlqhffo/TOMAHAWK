package org.kosta.toma.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.ShopDAO;

public class FindShopListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = null;
		long ShopCount = ShopDAO.getInstance().findShopCount();
		if(pageNo == null) {
			pagination= new Pagination(ShopCount);
		}else {
			pagination= new Pagination(ShopCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		request.setAttribute("shoplist",ShopDAO.getInstance().findShopList(pagination));
		return "board/shop-board.jsp";
	}
}