package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.vo.BoardVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ReviewCommentVO;

public class ReviewCommentDAO {
	private static ReviewCommentDAO instance=new ReviewCommentDAO();
	private DataSource dataSource;
	private ReviewCommentDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ReviewCommentDAO getInstance()   {			
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
	
	public synchronized ReviewCommentVO findReviewByNo(long no) throws SQLException { //댓글 등록되면 하나 가져오기.
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		ReviewCommentVO comment = null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT c.comment_no, m.email, m.nick ,b.board_no, c.comment_content, ");
			sb.append("to_char(comment_date, 'yy.mm.dd hh24:mi') as comment_date, to_char(comment_edit_date, 'yy.mm.dd hh24:mi') as comment_edit_date, ");
			sb.append("c.score FROM comments c inner join member m on c.email = m.email inner join board b on c.board_no = b.board_no ");
			sb.append("where b.board_no=? order by c.comment_no desc");
			ps = con.prepareStatement(sb.toString());
			ps.setLong(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				comment = new ReviewCommentVO();
				comment.setCommentNo(rs.getLong("comment_no"));
				MemberVO member = new MemberVO();
				member.setEmail(rs.getString("email"));
				member.setNick(rs.getString("nick"));
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				comment.setContent(rs.getString("comment_content"));
				comment.setCommentDate(rs.getString("comment_date"));
				comment.setCommentEditDate(rs.getString("comment_edit_date"));
				comment.setScore(rs.getLong("score"));
				comment.setMember(member);
				comment.setBoard(board);
			
			}
		}finally {
			closeAll(rs, ps, con);
		}
		return comment;
	}
	
	public int writeComment(ReviewCommentVO comment) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int num = 0;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("insert into comments(comment_no, email, board_no, comment_content, comment_date) ");
			sb.append("values(toma_comment_seq.nextval,?,?,?,sysdate)");
			ps = con.prepareStatement(sb.toString());
			ps.setString(1, comment.getMember().getEmail());
			ps.setLong(2, comment.getBoard().getBoardNo());
			ps.setString(3, comment.getContent());
			num = ps.executeUpdate();
			
		}finally {
			closeAll(ps, con);
		}
		return num;
	}
	public List<ReviewCommentVO> findCommentsListByNo(long boardNo) throws SQLException { //댓글 목록 뿌리기
		List<ReviewCommentVO> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("select c.comment_no, c.comment_content, to_char(comment_date, 'yy.mm.dd hh24:mi') as comment_date, m.nick, m.email, b.board_no from comments c inner join member m ");
			sb.append("on c.email = m.email inner join board b on c.board_no = b.board_no where b.board_no=? order by comment_no");
			ps = con.prepareStatement(sb.toString());
			ps.setLong(1, boardNo);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewCommentVO comment = new ReviewCommentVO();
				comment.setCommentNo(rs.getLong("comment_no"));
				comment.setContent(rs.getString("comment_content"));
				comment.setCommentDate(rs.getString("comment_date"));
				MemberVO member = new MemberVO();
				member.setNick(rs.getString("nick"));
				member.setEmail(rs.getString("email"));
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				comment.setMember(member);
				comment.setBoard(board);
				list.add(comment);
			}
			
		}finally {
			closeAll(rs, ps, con);
		}
		
		
		return list;
	}
	public void deleteComment(long commentNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "delete from comments where comment_no=?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, commentNo);
			ps.executeUpdate();
			
		}finally {
			closeAll(ps, con);
		}
		
	}
	
	
}
