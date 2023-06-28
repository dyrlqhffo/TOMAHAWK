package org.kosta.toma.controller.bookmark;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BookmarkDAO;
import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.vo.BookmarkVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ShopVO;

public class SetBookmarkController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		BookmarkVO bookmark = new BookmarkVO();
		ShopVO svo = new ShopVO();
		long no=Long.parseLong(request.getParameter("shopNo"));
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		
		bookmark.setMember(member);
		bookmark.setShop(svo);
		BookmarkDAO.getInstance().setBookmark(bookmark,no);
		if(request.getMethod().equals("POST")==false) 
			throw new ServletException("POST방식만 가능합니다");
		/*
		 * if(session==null||session.getAttribute("mvo")==null) return
		 * "redirect:FindShopList.shop";
		 */
		return "redirect:FindShopList.shop?no="+no;
	}

}
