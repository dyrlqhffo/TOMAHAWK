package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BoardDAO;

public class FindBoardByNoController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		long no=Long.parseLong(request.getParameter("no"));
		//게시물 조회
		request.setAttribute("post", BoardDAO.getInstance().findBoardByNo(no));
		//조회수 중복 불가
		@SuppressWarnings("unchecked")
		ArrayList<Long> BoardNoList = (ArrayList<Long>) session.getAttribute("BoardNoList");
		boolean existNo = BoardNoList.contains(no);
		if(existNo) {
			System.out.println(existNo+"읽은 글");
		}else {
			System.out.println(existNo+"조회수 증가");
			//조회수 증가
			BoardDAO.getInstance().updateHits(no);
			BoardNoList.add(no);
		}
		return "board/board-detail.jsp";
	}
}
