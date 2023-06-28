package org.kosta.toma.test;

import org.kosta.toma.model.dao.NoticeBoardDAO;


public class TestUnitDelete {
	public static void main(String[] args) {
		try {
		long no=108;
		NoticeBoardDAO.getInstance().deleteBoard(no);
			System.out.println("삭제되었음");
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		}
		
		
	}


