package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;
import javax.print.attribute.standard.PresentationDirection;
import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class NoticeBoardDAO {
	private static NoticeBoardDAO instance = new NoticeBoardDAO();
	private DataSource dataSource;

	private NoticeBoardDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static NoticeBoardDAO getInstance() {
		return instance;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
		/*
		 * select b.board_no,b.title,m.nick,to_char(reg_date,'YYYY.MM.DD') as
		 * reg_date,b.content,b.board_type from (select row_number(), over(oreder by
		 * board_no_desc) as rnum,board,title,reg_date,hits,email,content,board_type
		 * from board) b inner join member m on b.email=e.email where run between ? and
		 * ?;
		 * 
		 */
	}

	public ArrayList<BoardVO> findBoardList(Pagination pagination) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> list = new ArrayList<>();

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date,TO_CHAR(reg_date,'yyyy.MM.DD hh24:mi') as edit_date, b.hits, b.content, b.board_type ");		
			sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY board_no DESC) ");
			sql.append("AS rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type ");
			sql.append("FROM board b WHERE b.board_type='notice') b ");
			sql.append("INNER JOIN member m ON b.email = m.email ");
			sql.append("WHERE rnum between ? AND ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setBoardNo(rs.getLong("board_no"));
				MemberVO mvo = new MemberVO();
				mvo.setNick(rs.getString("nick"));
				bvo.setMember(mvo);
				bvo.setTitle(rs.getString("title"));
				bvo.setContent(rs.getString("content"));
				bvo.setRegisterDate(rs.getString("reg_date"));
				bvo.setEditDate(rs.getString("edit_date"));
				bvo.setHits(rs.getLong("hits"));
				bvo.setBoardType(rs.getString("board_type"));
				list.add(bvo);
			}

		} finally {
			closeAll(rs, pstmt, con);

		}
		return list;

	}

	public long findBoardPostCount() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long totalBoardCount = 0;

		try {
			con = dataSource.getConnection();
			String sql = "select*count from board";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(0, totalBoardCount);
			rs = pstmt.executeQuery();
			totalBoardCount = rs.getLong(1);

		} finally {
			closeAll(rs, pstmt, con);

		}

		return totalBoardCount;

	}

	public BoardVO findBoardByNo(long boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO bvo = null;

		try {
			con = dataSource.getConnection();
			String sql = "select b.board_no,b.title,m.nick,b.hits,TO_CHAR(reg_date,'yyyy.MM.DD') as reg_date,b.content from board b inner join member m ON b.email=m.email where b.board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bvo = new BoardVO();
				bvo.setBoardNo(rs.getLong("board_no"));
				bvo.setTitle(rs.getString("title"));
				MemberVO mvo=new MemberVO();
				mvo.setNick(rs.getString("nick"));
				bvo.setMember(mvo);
				bvo.setHits(rs.getLong("hits"));
				bvo.setRegisterDate(rs.getString("reg_date"));
				bvo.setContent(rs.getString("content"));
				
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return bvo;

	}

	public void updateHits(long no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=dataSource.getConnection();
			String sql="update board set hits=hits+1 where board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.executeUpdate();
			
		}finally{
			closeAll(pstmt, con);
			
		}
		
	}

	public long findTotalNoticeCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		long totalNoticeCount=0;
		
		try {
			con=dataSource.getConnection();
			String sql="select count(*) from board where board_type= 'notice'";
			pstmt=con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				totalNoticeCount=rs.getLong(1);
				
			
			}
			
		}finally {
			closeAll(rs, pstmt, con);			
		}
						
		return totalNoticeCount;
	}

	public void Update(BoardVO vo) throws SQLException {
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = dataSource.getConnection();
	        String sql = "update board set title = ?, content = ?, edit_date = sysdate where board_no = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, vo.getTitle());
	        pstmt.setString(2, vo.getContent());
	        pstmt.setLong(3, vo.getBoardNo());
	        pstmt.executeUpdate();

	    } finally {
	        closeAll(pstmt, con);
	    }
	}

	public void deleteBoard(long no) throws SQLException {
		Connection con= null;
		PreparedStatement pstmt = null;

	
		try {
			con=dataSource.getConnection();
			String sql="delete from board where Board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.executeUpdate();
			System.out.println("삭제되었음");
		}finally {
			closeAll(pstmt, con);
			
			
		}
		
	}

	public void WriteBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		System.out.println(vo);
		try {
			con=dataSource.getConnection();
			String sql="insert into board(board_no, title , content, reg_date, email , board_type) values(toma_board_seq.nextval, ?, ?, sysdate, ? ,'notice')";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getMember().getEmail());
			//pstmt.setString(4, vo.getBoardType());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
		
		
	}

}