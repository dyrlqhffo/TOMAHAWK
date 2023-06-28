package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;

public class ReviewBoardDAO {
	private static ReviewBoardDAO instance=new ReviewBoardDAO();
	private DataSource dataSource;
	private ReviewBoardDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ReviewBoardDAO getInstance()   {			
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
	
	public List<BoardVO> findReviewBoardList(Pagination pagination) throws SQLException{
		List<BoardVO> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
	
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("select rnum, b.board_no, b.title, m.nick, to_char(reg_date, 'yy.mm.dd hh24:mi')as reg_date, b.hits, b.content, b.board_type ");
			sb.append("from (select row_number() over(order by board_no desc) as rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type ");
			sb.append("from board b where b.board_type = 'review') b ");
			sb.append("inner join member m on b.email = m.email where rnum between ? and ?");
			ps = con.prepareStatement(sb.toString());
			ps.setLong(1, pagination.getStartRowNumber());
			ps.setLong(2, pagination.getEndRowNumber());
			rs = ps.executeQuery();
		
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				MemberVO member = new MemberVO();
				member.setNick(rs.getString("nick"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegisterDate(rs.getString("reg_date"));
				board.setHits(rs.getLong("hits"));
				board.setBoardType(rs.getString("board_type"));
				board.setMember(member);
				list.add(board);
				
			}
		}finally {
			closeAll(rs, ps, con);
		}
		
		
		return list;
		
	}
	
	
	public BoardVO findReviewBoardByNo(long no) throws SQLException {
		BoardVO board = null;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("select b.board_no, m.email, m.nick, b.title, b.content, to_char(reg_date, 'yyyy.mm.dd hh24:mi') as reg_date, b.board_type ");
			sb.append("from board b inner join member m on b.email=m.email where b.board_no=?");
			ps = con.prepareStatement(sb.toString());
			ps.setLong(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				MemberVO member = new MemberVO();
				member.setEmail(rs.getString("email"));
				member.setNick(rs.getString("nick"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegisterDate(rs.getString("reg_date"));
				board.setBoardType(rs.getString("board_type"));
				board.setMember(member);
			}
		}finally {
			closeAll(rs, ps, con);
		}
		return board;
		
	}
	public void writeReviewBoard(BoardVO board) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO board(board_no, email, title, content, reg_date, board_type) ");
			sb.append("VALUES(toma_board_seq.nextval, ?, ?, ?, sysdate, ?)");
			ps = con.prepareStatement(sb.toString());
			ps.setString(1, board.getMember().getEmail());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getBoardType());
			ps.executeUpdate();
			
		}finally {
			closeAll(ps, con);
		
		}
	}
	public void readNum(long no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "update board set hits= hits+1 where board_no=?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, no);
			ps.executeUpdate();
			
		}finally {
			closeAll(ps, con);
		}
		
	}
	public void deleteReviewBoard(long no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "delete from board where board_no=?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, no);
			ps.executeUpdate();
			
		}finally {
			closeAll(ps, con);
			
		}
	}
	
	public void updateReviewBoard(BoardVO board) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con = dataSource.getConnection();
			String sql = "update board set title=?, content=?, edit_date=sysdate where email=? and board_no=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setString(3, board.getMember().getEmail());
			ps.setLong(4, board.getBoardNo());
			ps.executeUpdate();
		}finally {
			closeAll(ps, con);
		}
	}
	public long findTotalReviewBoardCount() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		long num = 0;
		
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from board where board_type='review'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getLong(1);
			}
			
		}finally {
			closeAll(ps, con);
		}
		return num;
	}
	

}
