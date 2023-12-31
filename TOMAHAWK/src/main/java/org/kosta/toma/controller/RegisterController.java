package org.kosta.toma.controller;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.MemberVO;

public class RegisterController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("phone_num");
		MemberVO vo = new MemberVO(email,nick,name,password, tel,0);
		MemberDAO.getInstance().register(vo);
		}catch (SQLIntegrityConstraintViolationException e) {
			return "redirect:member/register-fail.jsp";
		}
		return "redirect:index.jsp";
	}
}
