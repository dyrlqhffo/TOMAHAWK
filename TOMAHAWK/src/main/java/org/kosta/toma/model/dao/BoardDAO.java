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
import org.kosta.toma.model.vo.ShopVO;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private DataSource dataSource;

	private BoardDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BoardDAO getInstance() {
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
	}

	//---[ 게시판 목록 조회 메서드 ]---//
	public ArrayList<BoardVO> findBoardList(Pagination pagination) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> boardList = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date, b.hits, b.content, b.board_type ");
			sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY board_no DESC) ");
			sql.append("AS rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type ");
			sql.append("FROM board b) b ");
			sql.append("INNER JOIN member m ON b.email = m.email WHERE rnum between ? AND ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				board.setTitle(rs.getString("title"));
				MemberVO member = new MemberVO();
				member.setNick(rs.getString("nick"));
				board.setMember(member);
				board.setRegisterDate(rs.getString("reg_date"));
				board.setHits(rs.getLong("hits"));
				board.setContent(rs.getString("content"));
				board.setBoardType(rs.getString("board_type"));
				boardList.add(board);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return boardList;
	}

	//---[ 자유게시판 목록 조회 메서드 ]---//
	public ArrayList<BoardVO> findFreeBoardList(Pagination pagination) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> freeBoardList = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT rnum, b.board_no, b.title, m.nick, TO_CHAR(b.reg_date, 'YY.MM.DD') AS reg_date, b.hits, b.content, b.board_type ");
			sql.append("FROM (SELECT ROW_NUMBER() OVER(ORDER BY board_no DESC) ");
			sql.append("AS rnum, b.board_no, b.title, b.reg_date, b.hits, b.email, b.content, b.board_type ");
			sql.append("FROM board b WHERE b.board_type='free') b ");
			sql.append("INNER JOIN member m ON b.email = m.email WHERE rnum between ? AND ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegisterDate(rs.getString("reg_date"));
				board.setHits(rs.getLong("hits"));
				board.setBoardType(rs.getString("board_type"));
				MemberVO member = new MemberVO();
				member.setNick(rs.getString("nick"));
				board.setMember(member);
				freeBoardList.add(board);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return freeBoardList;
	}
	
	//---[ 자유게시판 게시글 수 조회 메서드 ]---//
	public long findTotalFreeBoardCount() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long totalFreeBoardCount = 0;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT COUNT(*) FROM board WHERE board_type = 'free'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalFreeBoardCount = rs.getLong(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return totalFreeBoardCount;
	}

	//---[ 게시글 번호를 통한 게시물 상세조회 메서드 ]---//
	public BoardVO findBoardByNo(long boardNo) throws SQLException {
		BoardVO board = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append( "SELECT b.board_no, b.title, b.content, TO_CHAR(reg_date,'YYYY.MM.DD HH24:MI:SS') ");
			sql.append("AS reg_date, b.hits, b.board_type, m.email, m.nick FROM  board b ");
			sql.append("INNER JOIN member m ON b.email = m.email ");
			sql.append("WHERE b.board_no = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setLong(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new BoardVO();
				board.setBoardNo(rs.getLong("board_no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegisterDate(rs.getString("reg_date"));
				board.setBoardType(rs.getString("board_type"));
				MemberVO member = new MemberVO();
				member.setEmail(rs.getString("email"));
				member.setNick(rs.getString("nick"));
				board.setMember(member);
				board.setHits(rs.getLong("hits"));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return board;
	}

	//---[ 게시글 신규 작성 메서드 ]---//
	public void addBoard(BoardVO board) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO board(board_no, title, content, reg_date, email, board_type) ");
			sql.append("VALUES(toma_board_seq.nextval, ?, ?, sysdate, ?, ?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getMember().getEmail());
			pstmt.setString(4, board.getBoardType());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	//---[ 게시글 삭제 메서드 ]---//
	public void deleteBoardByNo(long boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "DELETE FROM board WHERE board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, boardNo);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	//---[ 게시글 수정 메서드 ]---//
	public void updateBoard(BoardVO board) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE board SET title = ?, content = ?, board_type = ?, edit_date = sysdate WHERE board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getBoardType());
			pstmt.setLong(4, board.getBoardNo());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	//---[ 게시글 조회수 계산 메서드 ]---//
	public void countHits(long boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE board SET hits = hits + 1 WHERE board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, boardNo);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	//---[ 검색바 : 게시판별 & 키워드별 게시물 조회 메서드 ]---//
	public ArrayList<BoardVO> searchBoards(String boardType, String title) throws SQLException {
	    ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT b.board_no, b.title, b.content, TO_CHAR(reg_date, 'YYYY.MM.DD HH24:MI:SS') ");
			sql.append("AS reg_date, b.hits, b.board_type, m.email, m.nick FROM  board b ");
			sql.append("INNER JOIN member m ON b.email = m.email ");
			sql.append("WHERE board_type = ? AND title LIKE ?");		//---> 게시판별 & 키워드별 검색
			pstmt = con.prepareStatement(sql.toString());						//
			pstmt.setString(1, boardType);												//
	        pstmt.setString(2, "%" + title + "%");  									//
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            BoardVO board = new BoardVO();
	            board.setBoardNo(rs.getLong("board_no"));
	            board.setTitle(rs.getString("title"));
	            board.setContent(rs.getString("content"));
	            board.setRegisterDate(rs.getString("reg_date"));
	            board.setBoardType(rs.getString("board_type"));
	            MemberVO member = new MemberVO();
	            member.setEmail(rs.getString("email"));
	            member.setNick(rs.getString("nick"));
	            board.setMember(member);
	            board.setHits(rs.getLong("hits"));
	            boardList.add(board);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeAll(rs, pstmt, con);
	    }
	    return boardList;
	}

	//---[ 검색바 : 식당 조회 메서드 ]---//
	public ArrayList<ShopVO> searchShops(String title) throws SQLException {
		ArrayList<ShopVO> shopList = new ArrayList<ShopVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT s.shop_no, s.shop_name, s.shop_type, s.shop_address, m.nick ");
			sql.append("AS shop_no, shop_name, shop_type, shop_address, nick FROM shop s ");
			sql.append("INNER JOIN member m ON s.email=m.email WHERE shop_name LIKE ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, "%" + title + "%");
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	ShopVO shop = new ShopVO();
	        	shop.setShopNo(rs.getLong("shop_no"));
	        	shop.setShopName(rs.getString("shop_name"));
	        	shop.setShopType(rs.getString("shop_type"));
	        	shop.setShopAddress(rs.getString("shop_address"));
	            MemberVO member = new MemberVO();
	            member.setNick(rs.getString("nick"));
	            shop.setMember(member);
	            shopList.add(shop);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeAll(rs, pstmt, con);
	    }
	    return shopList;
	}

}
