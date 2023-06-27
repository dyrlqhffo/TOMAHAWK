package org.kosta.toma.test;


import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;


public class TestUnitFindBoard {
	public static void main(String[] args) {
		try {
			long boardNo=23;
	BoardVO bvo=NoticeBoardDAO.getInstance().findBoardByNo(boardNo);
		System.out.println(bvo);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
