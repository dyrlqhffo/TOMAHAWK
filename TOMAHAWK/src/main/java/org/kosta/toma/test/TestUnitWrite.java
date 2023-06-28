package org.kosta.toma.test;

import java.sql.SQLException;

import org.kosta.toma.model.dao.NoticeBoardDAO;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class TestUnitWrite {
	public static void main(String[] args) {
		try {
			String title="지각설명회";
			String content="지각설명회 번외편";
			String type="notice";
			
			MemberVO member=new MemberVO();
			
			BoardVO vo= new BoardVO(0,member,title,content,null,null,0,type);
			System.out.println(vo);
			NoticeBoardDAO.getInstance().WriteBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
