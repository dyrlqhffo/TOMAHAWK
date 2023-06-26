package org.kosta.toma.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.toma.model.DataSourceManager;
import org.kosta.toma.model.Pagination;
import org.kosta.toma.model.vo.MemberVO;
import org.kosta.toma.model.vo.ShopVO;

public class ShopDAO {
	private static ShopDAO instance=new ShopDAO();
	private DataSource dataSource;
	private ShopDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ShopDAO getInstance()   {			
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
	public ArrayList<ShopVO> findShopList(Pagination pagination) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ShopVO> list=new ArrayList<>();
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT shop_no,shop_name,shop_type,shop_address ");
			sql.append("FROM (SELECT row_number() over(ORDER BY shop_no DESC) as rnum,shop_no,shop_name,shop_type,shop_address FROM shop) ");
			sql.append("where rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setLong(1, pagination.getStartRowNumber());
			pstmt.setLong(2, pagination.getEndRowNumber());
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShopVO svo=new ShopVO();
				svo.setShopNo(rs.getLong(1));
				svo.setShopName(rs.getString(2));
				svo.setShopType(rs.getString(3));
				svo.setShopAddress(rs.getString(4));
				list.add(svo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public long findShopCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		long ShopCount=0;
		try {
			con=dataSource.getConnection();
			String sql = "select count(*) from shop";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ShopCount=rs.getLong(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return ShopCount;
	}
	public ShopVO findShopByNo(long no) throws SQLException{
		ShopVO svo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT s.shop_no,s.shop_name,s.shop_type,s.shop_address,m.nick,m.email ");
			sql.append("FROM  shop s ");
			sql.append("INNER JOIN member m ON s.email=m.email ");
			sql.append("WHERE shop_no=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setLong(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {		
				svo =new ShopVO();
				svo.setShopNo(rs.getLong(1));
				svo.setShopName(rs.getString(2));
				svo.setShopType(rs.getString(3));
				svo.setShopAddress(rs.getString(4));
				MemberVO mvo = new MemberVO();
				mvo.setNick(rs.getString(5));
				mvo.setEmail(rs.getString(6));
				svo.setMember(mvo);
			}				
		}finally {
			closeAll(rs, pstmt, con);
		}
		return svo;
	}
	public void writeShop(ShopVO svo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("insert into shop(shop_no,shop_name,shop_type,shop_address,email) ");
			sql.append("values(toma_shop_seq.nextval,?,?,?,?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, svo.getShopName());
			pstmt.setString(2, svo.getShopType());
			pstmt.setString(3, svo.getShopAddress());
			pstmt.setString(4, svo.getMember().getEmail());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	public void deleteShopByNo(long no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="delete from shop where shop_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void updateShop(ShopVO svo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE shop SET shop_name=?,shop_type=?,shop_address=? WHERE shop_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, svo.getShopName());
			pstmt.setString(2, svo.getShopType());
			pstmt.setLong(3, svo.getShopNo());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
}
