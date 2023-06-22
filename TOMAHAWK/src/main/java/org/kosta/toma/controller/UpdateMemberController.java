package org.kosta.toma.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.MemberDAO;
import org.kosta.toma.model.MemberVO;

public class UpdateMemberController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST METHOD 방식만 로그인 가능합니다");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		
		String pwd = request.getParameter("password");
		String nick = request.getParameter("nickname");
		String tel = request.getParameter("phone_num");
		
		MemberVO memb = MemberDAO.getInstance().update(member, pwd, nick, tel);
		
		return "redirect:index.jsp";
	}
		

}
