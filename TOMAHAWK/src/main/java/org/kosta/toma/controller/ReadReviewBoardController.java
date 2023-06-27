package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.ReviewBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class ReadReviewBoardController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:index.jsp";
		}
		String path = null;
		long no = Long.parseLong(request.getParameter("no"));
		BoardVO board = ReviewBoardDAO.getInstance().findReviewBoardByNo(no);
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		ArrayList<Long> reviewBoardNoList = (ArrayList<Long>)session.getAttribute("freeBoard");
		boolean existNo = reviewBoardNoList.contains(no);
		if(existNo == false && !board.getMember().getNick().equalsIgnoreCase(member.getNick()) ) {
			ReviewBoardDAO.getInstance().readNum(no);
			reviewBoardNoList.add(no);
		}
		
		
		if(board != null) {
			request.setAttribute("board", board);
			path = "review/readreviewboard.jsp";
		}else {
			path = "error.jsp";
		}
		
		return path;
	}

}
