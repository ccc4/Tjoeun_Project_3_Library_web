package mvc.dto;

import java.sql.Timestamp;

public class guestBookDTO {
	
	private int idx;
	private int m_idx;
	private String title;
	private String contents;
	private Timestamp writeDate;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
}
