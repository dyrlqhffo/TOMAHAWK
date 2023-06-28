package test;

import java.sql.SQLException;

import org.kosta.toma.model.dao.ReviewBoardDAO;
import org.kosta.toma.model.dao.ReviewCommentDAO;
import org.kosta.toma.model.vo.ReviewCommentVO;

public class TestUnitComment {
	
	public static void main(String[] args) {
		
		
		try {
			ReviewCommentVO review = ReviewCommentDAO.getInstance().findReviewByNo(99);
			System.out.println(review);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
