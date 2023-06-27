package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WriteReviewFormController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:index.jsp";
		}
		String path = "review/writeReviewBoardForm.jsp";
		
		return path;
	}

}
