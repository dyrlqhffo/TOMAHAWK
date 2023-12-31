package org.kosta.toma.controller.bookmark;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.kosta.toma.controller.AjaxViewServlet;
import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.BookmarkDAO;

@SuppressWarnings("unused")
public class DeleteBookmarkController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		long no=Long.parseLong(request.getParameter("shopNo"));
		String email = (String) session.getAttribute("sessionEmail");
		System.out.println(no+" "+email );
		BookmarkDAO.getInstance().DeleteBookmark(email, no);
		JSONObject json = new JSONObject();
		json.put("jsonResult", "ok");
		request.setAttribute("responsebody", json);
		
		return "AjaxView";
	}
}
