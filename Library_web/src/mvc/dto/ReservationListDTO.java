package mvc.dto;

import java.sql.Timestamp;

public class ReservationListDTO {
	
	private int idx;
	private int m_idx;
	private String nickname;
	private int b_idx;
	private String title;
	private Timestamp reserveDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Timestamp reserveDate) {
		this.reserveDate = reserveDate;
	}
	
	
}
