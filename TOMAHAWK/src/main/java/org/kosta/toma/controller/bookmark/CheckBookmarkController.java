package org.kosta.toma.controller.bookmark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.AjaxViewServlet;
import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.BookmarkDAO;


@SuppressWarnings("unused")
public class CheckBookmarkController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("sessionEmail");
		String shopNo = request.getParameter("shopNo");
		int checkbookmark = BookmarkDAO.getInstance().checkbookmark(email,shopNo);
		String result = null;
		if(checkbookmark == 1) {
			result = "fail";
		}else {
			result = "ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
