package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.dto.MsgDTO;
import mvc.util.JdbcCloser;

public class MsgDAO {
	private static MsgDAO instance = new MsgDAO();
	public static MsgDAO getInstance() {
		return instance;
	}
	private MsgDAO() {}
	
	private MsgDTO getMsgDTO(ResultSet rs) throws SQLException {
		MsgDTO dto = new MsgDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setFrom_idx(rs.getInt(2));
		dto.setFrom_nickname(rs.getString(3));
		dto.setTo_idx(rs.getInt(4));
		dto.setTo_nickname(rs.getString(5));
		dto.setTitle(rs.getString(6));
		dto.setContents(rs.getString(7));
		dto.setSendDate(rs.getTimestamp(8));
		dto.setReadDate(rs.getTimestamp(9));
		
		return dto;
	}
	
	public MsgDTO getRecievedMsgDTO(Connection conn, int idx) {
		MsgDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM recieved_message_view WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = getMsgDTO(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return dto;
	}
	
	public MsgDTO getSentMsgDTO(Connection conn, int idx) {
		MsgDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM sent_message_view WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = getMsgDTO(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return dto;
	}
	
	public int recieved_allCount(Connection conn, int m_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM recieved_message_view WHERE to_idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
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
	
	public int sent_allCount(Connection conn, int m_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM sent_message_view WHERE from_idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
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
	
	public ArrayList<MsgDTO> recievedList(Connection conn, int page, int onePage, int m_idx) {
		ArrayList<MsgDTO> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM recieved_message_view WHERE to_idx = ? ORDER BY idx DESC LIMIT ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, (page - 1) * onePage);
			pstmt.setInt(3, onePage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getMsgDTO(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<MsgDTO> sentList(Connection conn, int page, int onePage, int m_idx) {
		ArrayList<MsgDTO> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM sent_message_view WHERE from_idx = ? ORDER BY idx DESC LIMIT ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, (page - 1) * onePage);
			pstmt.setInt(3, onePage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getMsgDTO(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcCloser.close(rs);
			JdbcCloser.close(pstmt);
		}
		return list;
	}
	
	public int write(Connection conn, int from_idx, int to_idx, String title, String contents) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO message (from_idx, to_idx, title, contents) VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, from_idx);
			pstmt.setInt(2, to_idx);
			pstmt.setString(3, title);
			pstmt.setString(4, contents);
			
			int check = pstmt.executeUpdate();
			if(check == 0) re = 0;
			else re = 1;
			
		} catch (Exception e) {
			re = -1;
		} finally {
			JdbcCloser.close(pstmt);
		}
		return re;
	}
	
	public int read(Connection conn, int idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE message SET readDate = now() WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
	
	public int recievedDelete(Connection conn, int idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE message SET recieved_exist = 0 WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
	
	public int sentDelete(Connection conn, int idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE message SET sent_exist = 0 WHERE idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
	
	public int checkNewMsg(Connection conn, int m_idx) {
		int re = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(*) FROM recieved_message_view WHERE readDate IS NULL AND to_idx = ?;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
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
	
}
