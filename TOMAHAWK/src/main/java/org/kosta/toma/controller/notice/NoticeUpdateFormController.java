package org.kosta.toma.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;


public class NoticeUpdateFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("mvo") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "index.jsp";
	
	}
		long no=Long.parseLong(request.getParameter("no"));
		BoardVO board =  NoticeBoardDAO.getInstance().findBoardByNo(no);
		request.setAttribute("board", board);
		return "board/notice-board-updateform.jsp";
}	
}
