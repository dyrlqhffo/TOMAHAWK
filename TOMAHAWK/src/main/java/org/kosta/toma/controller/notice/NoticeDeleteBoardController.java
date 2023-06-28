package org.kosta.toma.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.NoticeBoardDAO;

public class NoticeDeleteBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			
			return "index.jsp";
						
		}
		long no=Long.parseLong(request.getParameter("boardNo"));
		NoticeBoardDAO.getInstance().deleteBoard(no);
		
		return "redirect:NoticeBoardList.notice";
	}

}
