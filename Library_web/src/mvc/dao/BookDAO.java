package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.dto.BookDTO;
import mvc.util.JdbcCloser;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	private BookDAO() {}
	
	private BookDTO getDTO(ResultSet rs) throws SQLException {
		BookDTO dto = new BookDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setTitle(rs.getString(2));
		dto.setAuthor(rs.getString(3));
		dto.setPublisher(rs.getString(4));
		dto.setImgName(rs.getString(5));
		dto.setAddDate(rs.getTimestamp(6));
		dto.setCount(rs.getInt(7));
		
		return dto;
	}
	
	public BookDTO getDTO(Connection conn, int idx) {
		BookDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM book WHERE idx = ?";
		
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

	public int allCount(Connection conn) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM book";
		
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
	
	public ArrayList<BookDTO> list(Connection conn, int page, int onePage) {
		ArrayList<BookDTO> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM book ORDER BY idx LIMIT ?, ?";
		
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
	
	public int add(Connection conn, String title, String author, String publisher, String imgPath) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO book (title, author, publisher, imgPath) VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, publisher);
			pstmt.setString(4, imgPath);
			
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
