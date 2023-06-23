package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.MemberVO;

public class UpdateController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:index.jsp";
		}else {
			String email = request.getParameter("email"); 
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String nick = request.getParameter("nick");
			String tel = request.getParameter("phone_num");
			MemberDAO.getInstance().updateMember(email,nick,name,tel);
			MemberVO mvo = new MemberVO(email, nick, name, password, tel, 0);
			session.setAttribute("mvo", mvo);
			return "redirect:index.jsp";
	}
}
}