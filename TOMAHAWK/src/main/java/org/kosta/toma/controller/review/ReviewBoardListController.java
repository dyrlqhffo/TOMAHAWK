package org.kosta.toma.controller.review;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.ReviewBoardDAO;
import org.kosta.toma.model.vo.BoardVO;


public class ReviewBoardListController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		String path = null;
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = null;
		long paginationNum = ReviewBoardDAO.getInstance().findTotalReviewBoardCount();
		if(pageNo == null) {
			pagination = new Pagination(paginationNum);
		}else {
			pagination = new Pagination(paginationNum, Long.parseLong(pageNo));
		}
		List<BoardVO> list = ReviewBoardDAO.getInstance().findReviewBoardList(pagination);
		request.setAttribute("pagination", pagination);
		request.setAttribute("reviewBoardList", list);
		
		if(list != null) {
			path = "review/reviewboardlist.jsp";
			request.setAttribute("list", list);
		}else {
			path = "error.jsp";
		}
		
		return path;
	}

}
