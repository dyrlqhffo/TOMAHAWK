package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.vo.BookmarkVO;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ShopVO;

public class BookmarkDAO {
	private static BookmarkDAO instance = new BookmarkDAO();
	private DataSource dataSource;

	private BookmarkDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BookmarkDAO getInstance() {
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

	public ArrayList<BookmarkVO> findBookmarkList(Pagination pagination,String sessionEmail) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BookmarkVO> bookmarkList = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select bm.bookmark_no,s.shop_no,m.email,s.shop_name ");
			sql.append("FROM (SELECT row_number() over(ORDER BY bookmark_no DESC) as rnum,bookmark_no,shop_no,email FROM bookmark) bm ");
			sql.append("inner join shop s ON bm.shop_no=s.shop_no ");
			sql.append("inner join member m on bm.email = m.email ");
			sql.append("WHERE rnum between ? AND ? AND bm.email= ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());
			pstmt.setString(3, sessionEmail);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookmarkVO bookmark = new BookmarkVO();
				bookmark.setBookmarkNo(rs.getLong("bookmark_no"));
				MemberVO member = new MemberVO();
				member.setEmail(rs.getString("email"));
				bookmark.setMember(member);
				ShopVO shop = new ShopVO();
				shop.setShopNo(rs.getLong("shop_no"));
				shop.setShopName(rs.getString("shop_name"));
				bookmark.setShop(shop);
				bookmarkList.add(bookmark);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return bookmarkList;
	}
	public ArrayList<BookmarkVO> findBookmarkForShop(String sessionEmail) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BookmarkVO> bookmarkList = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select bm.bookmark_no,s.shop_no,m.email,s.shop_name ");
			sql.append("FROM (SELECT row_number() over(ORDER BY bookmark_no DESC) as rnum,bookmark_no,shop_no,email FROM bookmark) bm ");
			sql.append("inner join shop s ON bm.shop_no=s.shop_no ");
			sql.append("inner join member m on bm.email = m.email ");
			sql.append("WHERE bm.email= ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, sessionEmail);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookmarkVO bookmark = new BookmarkVO();
				bookmark.setBookmarkNo(rs.getLong("bookmark_no"));
				MemberVO member = new MemberVO();
				member.setEmail(rs.getString("email"));
				bookmark.setMember(member);
				ShopVO svo = new ShopVO();
				svo.setShopNo(rs.getLong("shop_no"));
				svo.setShopName(rs.getString("shop_name"));
				bookmark.setShop(svo);
				bookmarkList.add(bookmark);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return bookmarkList;
	}
	public long findBookmarkCount(String sessionEmail) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long BookmarkCount = 0;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT COUNT(*) FROM Bookmark WHERE email= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sessionEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BookmarkCount = rs.getLong(1);
				System.out.println(BookmarkCount);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return BookmarkCount;
	}

	public int setBookmark(BookmarkVO bookmark) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		int num = 0;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("insert into bookmark(bookmark_no,shop_no,email) ");
			sql.append("values(toma_bookmark_seq.nextval,?,?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setLong(1, bookmark.getShop().getShopNo());
			pstmt.setString(2, bookmark.getMember().getEmail());
			num = pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
		return num;
	}
	public void DeleteBookmark(String email, long no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="delete from BOOKMARK where shop_no = ?  and email= ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public int checkbookmark(String email, String shopNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from BOOKMARK where email= ? and shop_no= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, shopNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}
}
