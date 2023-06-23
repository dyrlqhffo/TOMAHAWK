package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class BoardDAO {
	private static BoardDAO instance=new BoardDAO();
	private DataSource dataSource;
	private BoardDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BoardDAO getInstance()   {			
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	public ArrayList<BoardVO> findBoardList(Pagination pagination) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<BoardVO> list=new ArrayList<>();
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT b.board_no,b.title,m.nick,TO_CHAR(reg_date,'YYYY.MM.DD') as reg_date,b.hits,b.content,b.board_type ");
			sql.append("FROM (SELECT row_number() over(ORDER BY board_no DESC) as rnum,board_no,title,reg_date,hits,email,content,board_type FROM board) b ");
			sql.append("INNER JOIN member m ON b.email=m.email ");
			sql.append("where rnum between ? and ?");
			System.out.println(sql.toString());
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardVO bvo=new BoardVO();
				bvo.setBoardNo(rs.getLong("board_no"));
				bvo.setTitle(rs.getString("title"));
				MemberVO mvo=new MemberVO();
				mvo.setNick(rs.getString("nick"));
				bvo.setMember(mvo);
				bvo.setRegisterDate(rs.getString("reg_date"));
				bvo.setHits(rs.getLong("hits"));
				bvo.setContent(rs.getString("content"));
				bvo.setBoardType(rs.getString("board_type"));
				list.add(bvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public long findTotalFreeBoardCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		long totalFreeBoardCount=0;
		try {
			con=dataSource.getConnection();
			String sql = "select count(*) from board where board_type = 'free'";
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalFreeBoardCount=rs.getLong(1);
				System.out.println(totalFreeBoardCount);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalFreeBoardCount;
	}
	public BoardVO findBoardByNo(long no) throws SQLException{
		BoardVO bvo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT b.board_no, b.title,b.content,to_char(time_posted,'YYYY.MM.DD HH24:MI:SS') AS reg_date, b.hits,m.id,m.nick ");
			sql.append("FROM  board b ");
			sql.append("INNER JOIN member m ON b.id=m.id ");
			sql.append("WHERE b.board_no=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setLong(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {		
				bvo=new BoardVO();
				bvo.setBoardNo(rs.getLong("no"));
				bvo.setTitle(rs.getString("title"));
				bvo.setContent(rs.getString("content"));
				MemberVO mvo=new MemberVO();
				mvo.setEmail(rs.getString("email"));
				mvo.setNick(rs.getString("nick"));
				bvo.setMember(mvo);
				bvo.setRegisterDate(rs.getString("reg_date"));
				bvo.setHits(rs.getLong("hits"));
			}				
		}finally {
			closeAll(rs, pstmt, con);
		}
		return bvo;
	}
	public void writeBoard(BoardVO bvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("insert into board(board_no,title,content,reg_date,email,board_type) ");
			sql.append("values(toma_board_seq.nextval,?,?,sysdate,?,?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getContent());
			pstmt.setString(3, bvo.getMember().getEmail());
			pstmt.setString(4, bvo.getBoardType());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	public void deleteBoardByNo(long no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="delete from board where board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void updateBoard(BoardVO bvo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE board SET title=?,content=?,board_type=? WHERE board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getContent());
			pstmt.setLong(3, bvo.getBoardNo());
			pstmt.setString(4, bvo.getBoardType());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void updateHits(long no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE board SET hits=hits+1 WHERE board_no =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			System.out.println(sql);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
}
