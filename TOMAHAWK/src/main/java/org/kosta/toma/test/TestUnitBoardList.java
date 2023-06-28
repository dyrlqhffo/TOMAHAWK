//package org.kosta.toma.test;
//
//import java.util.ArrayList;
//
//import org.kosta.toma.model.Pagination;
//import org.kosta.toma.model.dao.NoticeBoardDAO;
//import org.kosta.toma.model.vo.BoardVO;
//
//public class TestUnitBoardList {
//	public static void main(String[] args) {
//		try {
//			String type="notice";
//			ArrayList<BoardVO> list = NoticeBoardDAO.getInstance().findBoardList(type);
//			for(BoardVO board : list) {
//				System.out.println(board);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		}
//	}
//}
