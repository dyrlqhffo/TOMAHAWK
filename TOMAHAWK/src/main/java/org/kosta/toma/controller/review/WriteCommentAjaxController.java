package org.kosta.toma.controller.review;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.kosta.toma.controller.Controller;
import org.kosta.toma.model.dao.BoardDAO;
import org.kosta.toma.model.dao.ReviewCommentDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ReviewCommentVO;

public class WriteCommentAjaxController implements Controller{
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		HttpSession session = request.getSession();
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:error.jsp";
		}
		
		if (request.getMethod().equals("POST") == false) {
			throw new ServletException("POST 방식만 서비스 됩니다.");
		}
		
		long no = Long.parseLong(request.getParameter("no")); //넘어온 게시판 번호
		String comment = request.getParameter("comment"); //댓글 내용
		MemberVO member = (MemberVO)session.getAttribute("mvo");//회원
		BoardVO board = BoardDAO.getInstance().findBoardByNo(no); //번호로 게시판 찾음.

		ReviewCommentVO rcomment = new ReviewCommentVO(member, board, comment); //댓글 객체로 만들어줌.
		int num = ReviewCommentDAO.getInstance().writeComment(rcomment); //
		ReviewCommentVO reviewcomment  = ReviewCommentDAO.getInstance().findReviewByNo(no);
		System.out.println("reviewcomment = "+reviewcomment);
		JSONObject json = new JSONObject();
		if(num == 1) {
			json.put("jsonResult", "ok");
			json.put("jsonComment",new JSONObject(reviewcomment));
		}else {
			json.put("jsonResult", "no");
		}
		request.setAttribute("responsebody", json);
		
		return "AjaxView";

		}
	}
