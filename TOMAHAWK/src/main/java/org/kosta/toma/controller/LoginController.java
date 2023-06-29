package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.MemberVO;

public class LoginController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST METHOD 방식만 로그인 가능합니다");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		MemberVO mvo=MemberDAO.getInstance().login(email, password);
		if(mvo==null) {
			return "redirect:member/login-fail.jsp";
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("mvo", mvo);
			session.setAttribute("sessionEmail", mvo.getEmail());
			session.setAttribute("freeBoard", new ArrayList<Long>());
			return "redirect:index.jsp";
		}
	}

}