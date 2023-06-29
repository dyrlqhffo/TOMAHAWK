package org.kosta.toma.controller.free;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class UpdateBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST") == false)
            throw new ServletException("POST방식만 가능합니다");
        HttpSession session = request.getSession();
        if(session == null || session.getAttribute("mvo") == null) {
            System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다**");
            return "redirect:index.jsp";
        }

        long boardNo = Long.parseLong(request.getParameter("boardNo"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String boardType = request.getParameter("boardType");

        MemberVO member = (MemberVO) session.getAttribute("mvo");
        BoardVO board = new BoardVO();
        board.setBoardNo(boardNo);
        board.setTitle(title);
        board.setContent(content);
        board.setMember(member);
        board.setBoardType(boardType);
        BoardDAO.getInstance().updateBoard(board);
        return "redirect:FreeBoardList.do";
	}
}





/*
		long boardNo=Long.parseLong(request.getParameter("boardNo"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        BoardVO board = new BoardVO();
        board.setBoardNo(boardNo);
        board.setTitle(title);
        board.setContent(content);
        BoardDAO.getInstance().updateBoard(board);
*/