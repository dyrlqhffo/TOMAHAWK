package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.ReviewBoardDAO;
import org.kosta.toma.model.vo.BoardVO;

public class UpdateReviewBoardFormController implements Controller{
	
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
		
		long no = Long.parseLong(request.getParameter("no"));
		BoardVO board =  ReviewBoardDAO.getInstance().findReviewBoardByNo(no);
		request.setAttribute("board", board);
		return "review/updateReviewForm.jsp";
	}

}
