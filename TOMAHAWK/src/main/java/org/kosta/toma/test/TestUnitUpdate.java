package org.kosta.toma.test;

import java.sql.SQLException;

import org.kosta.toma.model.dao.MemberDAO;
import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class TestUnitUpdate {
	public static void main(String[] args) {
	 long no=23;
	 String title="잠을 푹 자고 합시다";
	 String content="잠은 피부에도 수면에도 좋고 키도 커요aa";
	 
	MemberVO member=new MemberVO();
		
			
	BoardVO vo= new BoardVO(no,member, title,content,null,null,0,null);
	 try {
		NoticeBoardDAO.getInstance().Update(vo);
		
		System.out.println(vo);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
}
