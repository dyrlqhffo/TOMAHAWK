package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.dao.MemberDAO;


public class CheckNickController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nick = request.getParameter("nick");
		int checkNick = MemberDAO.getInstance().checkNick(nick);
		String result = null;
		if(checkNick == 1) {
			result = "fail";
		}else {
			result = "ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
