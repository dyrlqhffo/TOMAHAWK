package org.kosta.toma.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;

public class WriteShopFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:FindShopList.do";
		}
		return "board/shop-write.jsp";
	}
}