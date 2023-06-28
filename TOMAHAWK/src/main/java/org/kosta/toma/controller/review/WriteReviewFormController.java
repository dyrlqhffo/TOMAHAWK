package org.kosta.toma.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;

public class WriteReviewFormController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		String path = "review/writeReviewBoardForm.jsp";
		
		return path;
	}

}
