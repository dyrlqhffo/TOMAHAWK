package org.kosta.toma.controller.bookmark;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.kosta.toma.controller.AjaxViewServlet;
import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.BookmarkDAO;
import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.BookmarkVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ShopVO;

@SuppressWarnings("unused")
public class SetBookmarkController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		ShopVO svo = new ShopVO();
		long no=Long.parseLong(request.getParameter("shopNo"));
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		svo.setShopNo(no);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		BookmarkVO bookmark = new BookmarkVO(member,svo);
		int num = BookmarkDAO.getInstance().setBookmark(bookmark);
		JSONObject json = new JSONObject();
		if(num == 1) {
			json.put("jsonResult", "ok");
			json.put("jsonComment",new JSONObject(bookmark));
		}else {
			json.put("jsonResult", "no");
		}
		request.setAttribute("responsebody",json);
		return "AjaxView";
	}

}
