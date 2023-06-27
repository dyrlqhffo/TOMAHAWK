package org.kosta.toma.controller.free;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.ShopVO;

public class SearchBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  HttpSession session = request.getSession();
	        if(session == null || session.getAttribute("mvo") == null) {
	            System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다**");
	            return "redirect:index.jsp";
	        }

	        String boardType = request.getParameter("board-search");
	        String title = request.getParameter("search");

	        ArrayList<BoardVO> boards = BoardDAO.getInstance().searchBoards(boardType, title);
	        //ArrayList<ShopVO> shops = BoardDAO.getInstance().searchShops(boardType, title);

	        request.setAttribute("boards", boards);
	        return "board/board-search-results.jsp";
	}
}
