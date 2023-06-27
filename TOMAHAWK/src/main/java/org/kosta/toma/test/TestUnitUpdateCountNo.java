package org.kosta.toma.test;

import java.sql.SQLException;

import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.MemberVO;

public class TestUnitUpdateCountNo {
	public static void main(String[] args) {
		long boardNo=23;
		try {
			NoticeBoardDAO.getInstance().updateHits(boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
}
