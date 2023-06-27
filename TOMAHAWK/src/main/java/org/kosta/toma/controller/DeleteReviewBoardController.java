package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.ReviewBoardDAO;

public class DeleteReviewBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if (request.getMethod().equals("POST") == false) {
			throw new ServletException("POST 방식만 서비스 됩니다.");
		}
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("mvo") == null) {		
			System.out.println("---비인증 상태이므로 서비스 제공이 불가합니다---");
			return "redirect:index.jsp";
		}
		long no = Long.parseLong(request.getParameter("no"));
		ReviewBoardDAO.getInstance().deleteReviewBoard(no);
		
		return "redirect:ReviewBoardList.do";
	}
}
