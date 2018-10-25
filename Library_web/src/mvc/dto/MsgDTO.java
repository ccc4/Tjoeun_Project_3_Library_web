package mvc.dto;

import java.sql.Timestamp;

public class MsgDTO {
	
	private int idx;
	private int from_idx;
	private String from_nickname;
	private int to_idx;
	private String to_nickname;
	private String title;
	private String contents;
	private Timestamp sendDate;
	private Timestamp readDate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getFrom_idx() {
		return from_idx;
	}
	public void setFrom_idx(int from_idx) {
		this.from_idx = from_idx;
	}
	public String getFrom_nickname() {
		return from_nickname;
	}
	public void setFrom_nickname(String from_nickname) {
		this.from_nickname = from_nickname;
	}
	public int getTo_idx() {
		return to_idx;
	}
	public void setTo_idx(int to_idx) {
		this.to_idx = to_idx;
	}
	public String getTo_nickname() {
		return to_nickname;
	}
	public void setTo_nickname(String to_nickname) {
		this.to_nickname = to_nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getSendDate() {
		return sendDate;
	}
	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}
	public Timestamp getReadDate() {
		return readDate;
	}
	public void setReadDate(Timestamp readDate) {
		this.readDate = readDate;
	}
	
}
