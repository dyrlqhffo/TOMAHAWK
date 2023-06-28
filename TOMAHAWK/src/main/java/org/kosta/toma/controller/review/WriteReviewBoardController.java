package org.kosta.toma.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.ReviewBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class WriteReviewBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		System.out.println(member);
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		BoardVO board = new BoardVO(0,member,title,content,null,null,0,type);
		
		ReviewBoardDAO.getInstance().writeReviewBoard(board);
		return "redirect:ReviewBoardList.review";
	}
}
