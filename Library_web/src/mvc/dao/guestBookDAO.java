package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.dto.BookDTO;
import mvc.dto.guestBookDTO;
import mvc.util.JdbcCloser;

public class guestBookDAO {
	private static guestBookDAO instance = new guestBookDAO();
	public static guestBookDAO getInstance() {
		return instance;
	}
	private guestBookDAO() {}
	
	private guestBookDTO getDTO(ResultSet rs) throws SQLException {
		guestBookDTO dto = new guestBookDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setM_idx(rs.getInt(2));
		dto.setTitle(rs.getString(3));
		dto.setContents(rs.getString(4));
		dto.setWriteDate(rs.getTimestamp(5));
		
		return dto;
	}
	
	public int allCount(Connection conn) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM guestBook WHERE exist = 1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public ArrayList<guestBookDTO> list(Connection conn, int page, int onePage) {
		ArrayList<guestBookDTO> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM guestBook ORDER BY idx DESC LIMIT ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * onePage);
			pstmt.setInt(2, onePage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getDTO(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return list;
	}
	
	public int add(Connection conn, int m_idx, String title, String contents) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO guestBook (m_idx, title, contents) VALUES (?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			
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
