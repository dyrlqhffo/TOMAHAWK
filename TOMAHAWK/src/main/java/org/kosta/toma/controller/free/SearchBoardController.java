package org.kosta.toma.controller.free;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.ShopVO;

public class SearchBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 	HttpSession session = request.getSession(false);
	        if(session == null || session.getAttribute("mvo") == null) {
	            // System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다**");
	            request.setAttribute("message", "검색창을 이용하기 위해서는 로그인해주시기 바랍니다.");
	            return "index.jsp";
	        }
	        
	        String boardType = request.getParameter("board-search");	// 게시판 종류를 받아와 저장하는 변수
	        String title = request.getParameter("search");							// 검색 키워드를 받아와 저장하는 변수

	        // 사용자가 선택한 게시판 분류가 (자유, 리뷰, 공지)게시판인 경우, 해당하는 게시판의 게시글을 조회
	        ArrayList<BoardVO> boards = BoardDAO.getInstance().searchBoards(boardType, title);
	        
	        // 사용자가 선택한 게시판 분류가 식당인 경우, 식당 목록을 조회
	        ArrayList<ShopVO> shops = BoardDAO.getInstance().searchShops(title);

	        request.setAttribute("boards", boards);
	        request.setAttribute("shops", shops);
	        return "board/board-search-results.jsp";		// 검색 결과 화면으로 이동
	}
}
