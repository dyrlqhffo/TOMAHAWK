package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.MemberDAO;
import org.kosta.toma.model.MemberVO;

public class RegisterMemberController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = null;
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");
		String tel = request.getParameter("phone_num");
		
		MemberVO memb = new MemberVO(email, nickname, name, pwd, tel, 0);
		MemberVO member = MemberDAO.getInstance().register(memb);
		if(member != null) {
			path="redirect:index.jsp";
		}else {
			path="redirect:index.jsp";
		}
		
		return path;
	}

}
