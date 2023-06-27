package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.ReviewBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class UpdateReviewBoardController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST") == false) {
			throw new ServletException("POST 방식만 지원됩니다.");
		}
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("mvo") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "redirect:FindPostList.do";
		}
		MemberVO member =(MemberVO)session.getAttribute("mvo");
		long no = Long.parseLong(request.getParameter("no"));
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardVO board = new BoardVO(no, member,title, content, null, null, 0, type);
		ReviewBoardDAO.getInstance().updateReviewBoard(board);
		
		return "ReadReviewBoard.do";
	}

}
