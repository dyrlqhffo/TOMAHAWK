package org.kosta.toma.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.ReviewBoardDAO;
import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.BoardVO;

public class ReviewBoardListController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
//		if(request.getMethod().equals("POST")==false) { 
//			throw new ServletException("POST방식만 가능합니다");
//		}
		
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:index.jsp";
		}
		String path = null;
		String review = "review";
		List<BoardVO> list = ReviewBoardDAO.getInstance().findReviewBoardList(review);
		if(list != null) {
			path = "review/reviewboardlist.jsp";
			request.setAttribute("list", list);
		}else {
			path = "error.jsp";
		}
		
		return path;
	}

}
