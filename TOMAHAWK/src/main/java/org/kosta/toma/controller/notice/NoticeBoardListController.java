package org.kosta.toma.controller.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;

public class NoticeBoardListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "index.jsp";
		
		}
		String pageNo= request.getParameter("pageNo");
		Pagination pagination=null;
		long totalNoticeCount=NoticeBoardDAO.getInstance().findTotalNoticeCount();
		if(pageNo == null) {
			pagination= new Pagination(totalNoticeCount);
		}else {
			pagination= new Pagination(totalNoticeCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		ArrayList<BoardVO> list = NoticeBoardDAO.getInstance().findBoardList(pagination);
		request.setAttribute("list", list);
		return "board/notice-board-list.jsp";
		
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
