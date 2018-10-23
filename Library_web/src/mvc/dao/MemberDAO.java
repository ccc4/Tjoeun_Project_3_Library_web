package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.dto.MemberDTO;
import mvc.util.JdbcCloser;

public class MemberDAO {

	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	private MemberDTO getDTO(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setId(rs.getString(2));
		dto.setPw(rs.getString(3));
		dto.setNickname(rs.getString(4));
		dto.setName(rs.getString(5));
		dto.setAge(rs.getInt(6));
		dto.setGender(rs.getInt(7));
		dto.setTel(rs.getInt(8));
		dto.setEmail(rs.getString(9));
		dto.setAddress(rs.getString(10));
		
		return dto;
	}
	
	public MemberDTO getDTO(Connection conn, String id) {
		MemberDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = getDTO(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return dto;
	}
	
	public MemberDTO getDTO(Connection conn, int idx) {
		MemberDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = getDTO(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return dto;
	}
	
	public int join(Connection conn, String id, String pw, String nickname, String name, int age, int gender, String tel, String email, String address) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO member (id, pw, nickname, name, age, gender, tel, email, address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nickname);
			pstmt.setString(4, name);
			pstmt.setInt(5, age);
			pstmt.setInt(6, gender);
			pstmt.setString(7, tel);
			pstmt.setString(8, email);
			pstmt.setString(9, address);
			
			int check = pstmt.executeUpdate();
			
			if(check == 0) re = 0;
			else re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int login(Connection conn, String id, String pw) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT pw FROM member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					re = 1;
				} else {
					re = 0;
				}
			} else {
				re = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int modify(Connection conn, int idx, String nickname, String name, int age, int gender, String tel,
			String email, String address) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE member SET nickname = ?, name = ?, age = ?, gender = ?, tel = ?, email = ?, address = ? WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, name);
			pstmt.setInt(3, age);
			pstmt.setInt(4, gender);
			pstmt.setString(5, tel);
			pstmt.setString(6, email);
			pstmt.setString(7, address);
			pstmt.setInt(8, idx);
			
			int check = pstmt.executeUpdate();
			
			if(check == 0) re = 0;
			else re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int pwChange(Connection conn, int idx, String newPw) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE member SET pw = ? WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setInt(2, idx);
			
			int check = pstmt.executeUpdate();
			
			if(check == 0) re = 0;
			else re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	
}
