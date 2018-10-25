package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.dto.BookDTO;
import mvc.dto.RentalListDTO;
import mvc.util.JdbcCloser;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	private BookDAO() {}
	
	private BookDTO getBookDTO(ResultSet rs) throws SQLException {
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
	
	public BookDTO getBookDTO(Connection conn, int idx) {
		BookDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM book WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = getBookDTO(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return dto;
	}
	
	public int getBookIdx(Connection conn, String title) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT idx FROM book WHERE title = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = rs.getInt(1);
			}
		} catch (Exception e) {
			re = 0;
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	private RentalListDTO getRentalListDTO(ResultSet rs) throws SQLException {
		RentalListDTO dto = new RentalListDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setM_idx(rs.getInt(2));
		dto.setNickname(rs.getString(3));
		dto.setB_idx(rs.getInt(4));
		dto.setTitle(rs.getString(5));
		dto.setReserveDate(rs.getTimestamp(6));
		
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
		
		String sql = "SELECT * FROM book ORDER BY title LIMIT ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * onePage);
			pstmt.setInt(2, onePage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getBookDTO(rs));
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
	
	public int checkRental(Connection conn, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM rental_list WHERE b_idx = ? AND returnDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
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

	public int checkRental(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM rental_list WHERE m_idx = ? AND b_idx = ? AND returnDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int checkReserve(Connection conn, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM reservation_list WHERE b_idx = ? AND rentalDate IS NULL AND cancelDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
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
	
	public int checkReserve(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM reservation_list WHERE m_idx = ? AND b_idx = ? AND rentalDate IS NULL AND cancelDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int rental(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO rental_list (m_idx, b_idx) VALUES (?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			
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
	
	public int reservationRental(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE reservation_list SET rentalDate = now() WHERE m_idx = ? AND b_idx = ? AND rentalDate IS NULL AND cancelDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			
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
	
	public int reserve(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO reservation_list (m_idx, b_idx) VALUES (?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			
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
	
	public int returnB(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE rental_list SET returnDate = now() WHERE m_idx = ? AND b_idx = ? AND returnDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			
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
	
	public int cancel(Connection conn, int m_idx, int b_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE reservation_list SET cancelDate = now() WHERE m_idx = ? AND b_idx = ? AND rentalDate IS NULL AND cancelDate IS NULL";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, b_idx);
			
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
	
	public ArrayList<RentalListDTO> rentalList(Connection conn, int m_idx) {
		ArrayList<RentalListDTO> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM rental_list_view WHERE m_idx = ? ORDER BY idx";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getRentalListDTO(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return list;
	}
	
}
