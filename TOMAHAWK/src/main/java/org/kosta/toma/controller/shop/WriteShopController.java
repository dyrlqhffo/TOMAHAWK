package org.kosta.toma.controller.shop;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.ShopDAO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ShopVO;

public class WriteShopController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		ShopVO svo = new ShopVO();
		String shopName = request.getParameter("shopName");
		String shopType = request.getParameter("shopType");
		String shopAddress = request.getParameter("shopAddress");
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		svo.setMember(mvo);
		svo.setShopName(shopName);
		svo.setShopType(shopType);
		svo.setShopAddress(shopAddress);
		ShopDAO.getInstance().writeShop(svo);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:FindShopList.do";
		return "redirect:FindShopList.do";
	}

}
