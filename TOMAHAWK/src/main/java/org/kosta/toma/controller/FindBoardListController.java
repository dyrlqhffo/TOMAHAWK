package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.BoardDAO;

public class FindBoardListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러");   
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = null;
		long totalFreeBoardCount = BoardDAO.getInstance().findTotalFreeBoardCount();
		if(pageNo == null) {
			pagination= new Pagination(totalFreeBoardCount);
		}else {
			pagination= new Pagination(totalFreeBoardCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		request.setAttribute("list",BoardDAO.getInstance().findBoardList(pagination));
		return "Board.jsp";
	}

}
