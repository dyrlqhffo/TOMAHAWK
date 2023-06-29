package org.kosta.toma.controller.review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.ReviewCommentDAO;

public class DeleteCommentAjaxController implements Controller {

	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		
		if (request.getMethod().equals("POST") == false) {
			throw new ServletException("POST 방식만 서비스 됩니다.");
		}
		
		long commentNo = Long.parseLong(request.getParameter("delCommentToNo"));
		System.out.println("commentNo = " + commentNo);
		ReviewCommentDAO.getInstance().deleteComment(commentNo);
		JSONObject json = new JSONObject();
		json.put("jsonResult", "ok");
		
		request.setAttribute("responsebody", json);
		
		return "AjaxView";
	}
}
