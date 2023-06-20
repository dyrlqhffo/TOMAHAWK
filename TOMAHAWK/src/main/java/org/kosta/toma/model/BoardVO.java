package org.kosta.toma.model;

public class BoardVO {
	private long boardNo;
	private MemberVO member;
	private String title;
	private String content;
	private String registerDate;
	private String editDate;
	private long hits;

	public BoardVO() {
		super();
	}

	public BoardVO(long boardNo, MemberVO member, String title, String content, String registerDate, String editDate,
			long hits) {
		super();
		this.boardNo = boardNo;
		this.member = member;
		this.title = title;
		this.content = content;
		this.registerDate = registerDate;
		this.editDate = editDate;
		this.hits = hits;
	}

	public long getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(long boardNo) {
		this.boardNo = boardNo;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public long getHits() {
		return hits;
	}

	public void setHits(long hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", member=" + member + ", title=" + title + ", content=" + content
				+ ", registerDate=" + registerDate + ", editDate=" + editDate + ", hits=" + hits + "]";
	}
}
