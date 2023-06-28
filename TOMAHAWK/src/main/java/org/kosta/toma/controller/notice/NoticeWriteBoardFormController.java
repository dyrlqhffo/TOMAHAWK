package org.kosta.toma.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.vo.MemberVO;

public class NoticeWriteBoardFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 HttpSession session = request.getSession(false);
		 MemberVO vo =(MemberVO) session.getAttribute("mvo");
	        if (session == null || session.getAttribute("mvo") == null || vo.getAdmin() != 2) {
	            System.out.println("**비인증 상태이므로 서비스 제공이 불가합니다.**");
	            return "index.jsp";
	        }
	        	        

	        return "board/notice-board-writeform.jsp";
	        
	}	
	
}
