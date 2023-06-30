package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.MemberDAO;

public class DeleteMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("mvo") == null) {
			//System.out.println("---[로그인 상태가 아니므로 회원 탈퇴가 불가합니다.]---");
			return "redirect:index.jsp";		
		}
		
		String email = request.getParameter("email");
		MemberDAO.getInstance().deleteMember(email);
		return "Logout.do";
	}

}
