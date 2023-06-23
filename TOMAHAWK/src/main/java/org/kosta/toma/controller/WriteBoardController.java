package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.BoardVO;

public class WriteBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		BoardVO bvo = new BoardVO();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String boardType = request.getParameter("boardType");
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setMember(mvo);
		bvo.setBoardType(boardType);
		BoardDAO.getInstance().writeBoard(bvo);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		return "redirect:FindBoardList.do";
	}

}
