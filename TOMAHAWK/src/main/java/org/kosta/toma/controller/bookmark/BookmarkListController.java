package org.kosta.toma.controller.bookmark;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.dao.BookmarkDAO;

public class BookmarkListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String sessionEmail = (String) session.getAttribute("sessionEmail");
		String pageNo = request.getParameter("pageNo");
		System.out.println(sessionEmail);
		Pagination pagination = null;
		long BookmarkCount = BookmarkDAO.getInstance().findBookmarkCount(sessionEmail);
		if(pageNo == null) {
			pagination= new Pagination(BookmarkCount);
		}else {
			pagination= new Pagination(BookmarkCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		request.setAttribute("bookmarkList",BookmarkDAO.getInstance().findBookmarkList(pagination,sessionEmail));
		return "board/bookmark-board-list.jsp";
	}

}
