package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.dao.MemberDAO;


public class CheckIdController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		int checkid = MemberDAO.getInstance().checkId(email);
		String result = null;
		if(checkid == 1) {
			result = "fail";
		}else {
			result = "ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
