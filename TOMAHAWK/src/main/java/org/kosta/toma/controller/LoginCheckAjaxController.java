package org.kosta.toma.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.MemberVO;

public class LoginCheckAjaxController implements Controller {

	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		MemberVO member = MemberDAO.getInstance().login(email, pwd);
		int num = MemberDAO.getInstance().checkId(email);
		JSONObject json = new JSONObject();
		if(num == 0) {
			json.put("jsonId", "no");
		}else {
			json.put("jsonId", "ok");
		}
		
		if(member != null) {
			json.put("jsonResult", "ok");
			json.put("json", new JSONObject(member));
		}else {
			json.put("jsonResult", "no");
		}
		request.setAttribute("responsebody", json);
		
		return "AjaxView";
	}
}
