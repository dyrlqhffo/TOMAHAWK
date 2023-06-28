package org.kosta.toma.controller.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.ReviewBoardDAO;
import org.kosta.toma.model.dao.ReviewCommentDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ReviewCommentVO;


public class ReadReviewBoardController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		String path = null;
		long no = Long.parseLong(request.getParameter("no"));
		BoardVO board = ReviewBoardDAO.getInstance().findReviewBoardByNo(no);
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		ArrayList<Long> reviewBoardNoList = (ArrayList<Long>)session.getAttribute("freeBoard");
		List<ReviewCommentVO> list = ReviewCommentDAO.getInstance().findCommentsListByNo(no);
		boolean existNo = reviewBoardNoList.contains(no);
		if(existNo == false && !board.getMember().getNick().equalsIgnoreCase(member.getNick()) ) {
			ReviewBoardDAO.getInstance().readNum(no);
			reviewBoardNoList.add(no);
		}
		
		
		if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("commentList", list);
			path = "review/readreviewboard.jsp";
		}else {
			path = "error.jsp";
		}
		
		return path;
	}

}
