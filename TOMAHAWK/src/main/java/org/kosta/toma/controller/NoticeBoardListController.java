package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;

public class NoticeBoardListController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "index.jsp";
		
		}
		String type = request.getParameter("type");
		ArrayList<BoardVO> list = NoticeBoardDAO.getInstance().findBoardList(type);
		request.setAttribute("list", list);
		return "board/board-list.jsp";
		
		
		}
	

}

// String pageNo=request.getParameter("pageNo");

/*
 * if(totalBoardCount==null) { Long
 * totalBoardCount=NoticeBoardDAO.getInstance().findTotalBoardCount();
 * pagination=new Pagination(totalBoardCount); }else { pagination=new
 * Pagination(totalBoardCount,Long.parseLong(pageNo));
 * 
 * }
 */

// request.setAttribute("pagination", pagination);
// request.setAttribute("list", totalBoardCount);
