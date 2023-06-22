package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.MemberDAO;
import org.kosta.toma.model.MemberVO;

public class DeleteMemberController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = null;
		HttpSession session = request.getSession();
	    MemberVO member = (MemberVO)session.getAttribute("mvo");
	    String pwd = request.getParameter("password");
	    MemberDAO.getInstance().delete(member.getEmail(), pwd);
	    
		return "Logout.do";
	}

}
