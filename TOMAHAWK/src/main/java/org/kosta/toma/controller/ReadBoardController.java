package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.MemberVO;

public class ReadBoardController implements Controller {
	@SuppressWarnings("unchecked")
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session == null || session.getAttribute("mvo") == null) {
            System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다**");
            return "redirect:index.jsp";
        }

        long boardNo = Long.parseLong(request.getParameter("boardNo"));

        //조회수 중복 불가
        ArrayList<Long> board = (ArrayList<Long>) session.getAttribute("freeBoard");
        
        boolean existNo = board.contains(boardNo);
        if(existNo) {
            System.out.println(existNo+"읽은 글");
        }else {
            System.out.println(existNo+"조회수 증가");
            //조회수 증가
            BoardDAO.getInstance().countHits(boardNo);
            board.add(boardNo);
        }
        //게시물 조회
        request.setAttribute("board", BoardDAO.getInstance().findBoardByNo(boardNo));
        return "board/board-detail.jsp";
	}
}