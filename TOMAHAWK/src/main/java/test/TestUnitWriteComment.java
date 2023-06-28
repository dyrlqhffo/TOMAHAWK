//package test;
//
//import java.sql.SQLException;
//
//import org.kosta.toma.model.dao.ReviewCommentDAO;
//import org.kosta.toma.model.vo.BoardVO;
//import org.kosta.toma.model.vo.MemberVO;
//import org.kosta.toma.model.vo.ReviewCommentVO;
//
//public class TestUnitWriteComment {
//
//	public static void main(String[] args) {
//		//ReviewCommentVO reviewComment = new ReviewCommentVO(no, member, board, comment);
//		MemberVO member = new MemberVO("hellojava@naver.com", "롤로노아김동현", null, null, null,0);
//		BoardVO board = new BoardVO(99, member, '뭐냐', "" );
//		ReviewCommentVO comment = new ReviewCommentVO(99, member,  );
//		try {
//			ReviewCommentDAO.getInstance().writeComment(null);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//	}
//}
