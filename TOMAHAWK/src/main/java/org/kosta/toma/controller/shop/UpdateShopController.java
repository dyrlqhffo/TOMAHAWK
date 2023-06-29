package org.kosta.toma.controller.shop;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.ShopDAO;
import org.kosta.toma.model.vo.ShopVO;

public class UpdateShopController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		long shopNo=Long.parseLong(request.getParameter("shopNo"));
		String shopType = request.getParameter("shopType");
		String shopName = request.getParameter("shopName");
		String shopAddress = request.getParameter("shopAddress");
		String shopImg = request.getParameter("shopImg");
		ShopVO svo = new ShopVO();
		svo.setShopNo(shopNo);
		svo.setShopName(shopName);
		svo.setShopType(shopType);
		svo.setShopAddress(shopAddress);
		svo.setShopImg(shopImg);
		ShopDAO.getInstance().updateShop(svo);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		return "redirect:FindShopList.do";
	}
}