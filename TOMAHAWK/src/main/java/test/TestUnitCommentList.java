//package test;
//
//import java.sql.SQLException;
//import java.util.List;
//
//import org.kosta.toma.model.dao.ReviewCommentDAO;
//import org.kosta.toma.model.vo.ReviewCommentVO;
//
//public class TestUnitCommentList {
//	
//	public static void main(String[] args) {
//		
//		
//		try {
//			List<ReviewCommentVO> list = ReviewCommentDAO.getInstance().findReviewByNo(99);
//			for(ReviewCommentVO comment : list) {
//				System.out.println(comment);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//}
