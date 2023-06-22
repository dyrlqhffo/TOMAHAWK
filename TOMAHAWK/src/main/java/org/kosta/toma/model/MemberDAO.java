package org.kosta.toma.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.kosta.toma.model.*;

public class MemberDAO {
	private static MemberDAO instance=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance()   {			
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
	public MemberVO login(String email, String password) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberVO mvo=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT * FROM member WHERE email=? AND password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next())
				mvo=new MemberVO(email, rs.getString("nick"), rs.getString("name") ,password, rs.getString("tel"), rs.getLong("admin"));
		}finally {
			closeAll(rs, pstmt, con);
		}
		return mvo;
	}
	
	public List<MemberVO> findMembers() throws SQLException{ //멤버 전체 조회
		List<MemberVO> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
	
		try {
			con = dataSource.getConnection();
			String sql="select * from member";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO member = new MemberVO(rs.getString("email"),rs.getString("nick"), rs.getString("name"),rs.getString("password"),rs.getString("tel"),rs.getLong("admin"));
				list.add(member);
			}
		}finally {
			closeAll(rs, ps, con);
		}
		return list;
	}
	
	public MemberVO findMemberByEmail(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		MemberVO member = null;
		
		try {
			con = dataSource.getConnection();
			String sql = "select * from member where email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO(email, rs.getString("nick"), rs.getString("name"), rs.getString("password"), rs.getString("tel"), rs.getLong("admin"));
			}
		}finally {
			closeAll(rs, ps, con);
		}
		return member;
	}
	
	
	
	public MemberVO register(MemberVO mem) throws SQLException { // 회원가입
		MemberVO member = null;
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "insert into member(email, password, name, nick, tel, admin) values(?,?,?,?,?,0)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mem.getEmail());
			ps.setString(2, mem.getPassword());
			ps.setString(3, mem.getName());
			ps.setString(4, mem.getNick());
			ps.setString(5, mem.getTel());
			int num = ps.executeUpdate();
			if(num != 0) {
				member = mem;
			}
		
		}finally {
			closeAll(ps, con);
		}
		return member;
	}
	
	
	public MemberVO update(MemberVO member, String pwd, String nick, String tel) throws SQLException {
		MemberVO memb = null;
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "update member set password=?, nick=?, tel=? where email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, nick);
			ps.setString(3, tel);
			ps.setString(4, member.getEmail());
			int num =ps.executeUpdate();
			
			if(num != 0) {
				memb = new MemberVO(member.getEmail(), nick, member.getName(), pwd, tel, member.getAdmin());
			}
			
		}finally {
			closeAll(ps, con);
		}
		
		return memb;
	}
	public void delete(String email, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con = dataSource.getConnection();
			String sql = "delete from member where email=? and password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ps.executeUpdate();
		}finally {
			closeAll(ps, con);
		}
	}	
}
