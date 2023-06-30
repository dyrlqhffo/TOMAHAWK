package org.kosta.toma.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class NoticeWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("mvo") == null) {
            //System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다.**");
            return "redirect:index.jsp";
	}
	  String title =request.getParameter("title");
	  String content =request.getParameter("content");
	  String type = request.getParameter("boardType");
	  	
	  MemberVO member = (MemberVO) session.getAttribute("mvo");
	  BoardVO vo= new BoardVO(0,member,title,content,null,null,0,null);
	  NoticeBoardDAO.getInstance().WriteBoard(vo);
	  
	return "redirect:NoticeBoardList.do";
	  
}
}
