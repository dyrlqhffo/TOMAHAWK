package org.kosta.toma.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class NoticeDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			
			return "index.jsp";
						
		}
		long no=Long.parseLong(request.getParameter("no"));
		BoardVO vo=NoticeBoardDAO.getInstance().findBoardByNo(no);
		MemberVO member = (MemberVO)session.getAttribute("mvo");
		ArrayList<Long> noticeList=(ArrayList<Long>) session.getAttribute("noticeList");
		boolean existNo=noticeList.contains(no);
		if(existNo == false && !vo.getMember().getNick().equalsIgnoreCase(member.getNick())) {
			System.out.println(existNo+"이미 조회한 게시글이므로 증가x");
			NoticeBoardDAO.getInstance().updateHits(no);
			noticeList.add(no);
			
		}			
		request.setAttribute("board", vo);
		return "board/board-detail.jsp";
			
	}

}
