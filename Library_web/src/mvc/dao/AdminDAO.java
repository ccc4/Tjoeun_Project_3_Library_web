package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mvc.util.JdbcCloser;

public class AdminDAO {
	
	private static AdminDAO instance = new AdminDAO();
	public static AdminDAO getInstance() {
		return instance;
	}
	private AdminDAO() {}
	
	public int login(Connection conn, String id, String pw) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT pw FROM adminTable WHERE id = ?";
		
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
}
