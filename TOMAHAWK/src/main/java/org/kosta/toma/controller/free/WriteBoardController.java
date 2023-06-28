package org.kosta.toma.controller.free;

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
		if (request.getMethod().equals("POST") == false) {
            throw new ServletException("POST 방식만 서비스 됩니다.");
        }
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("mvo") == null) {
            System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다.**");
            return "redirect:index.jsp";
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String boardType = request.getParameter("boardType");

        MemberVO member = (MemberVO) session.getAttribute("mvo");
        BoardVO board = new BoardVO();
        board.setTitle(title);
        board.setContent(content);
        board.setMember(member);
        board.setBoardType(boardType);
        BoardDAO.getInstance().addBoard(board);
        // 글작성 완료 후, 게시물 리스트 화면을 제공한다.
        return "redirect:FreeBoardList.free";		
	}

}
