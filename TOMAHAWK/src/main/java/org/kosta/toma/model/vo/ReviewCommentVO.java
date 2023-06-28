package org.kosta.toma.model.vo;

public class ReviewCommentVO {

	private long commentNo;
	private MemberVO member;
	private BoardVO board;
	private String content;
	private String commentDate;
	private String commentEditDate;
	private long score;
	
	public ReviewCommentVO() {
		super();
	}
	
	

	public ReviewCommentVO(MemberVO member, BoardVO board, String content) {
		super();
		this.member = member;
		this.board = board;
		this.content = content;
	}

	public ReviewCommentVO(long commentNo, MemberVO member, BoardVO board, String content,
			String commentDate, String commentEditDate, long score) {
		super();
		this.commentNo = commentNo;
		this.member = member;
		this.board = board;
		this.content = content;
		this.commentDate = commentDate;
		this.commentEditDate = commentEditDate;
		this.score = score;
	}



	public long getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(long commentNo) {
		this.commentNo = commentNo;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public BoardVO getBoard() {
		return board;
	}

	public void setBoard(BoardVO board) {
		this.board = board;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentEditDate() {
		return commentEditDate;
	}

	public void setCommentEditDate(String commentEditDate) {
		this.commentEditDate = commentEditDate;
	}

	public long getScore() {
		return score;
	}

	public void setScore(long score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "ReviewCommentVO [commentNo=" + commentNo + ", member=" + member + ", board=" + board
				+ ", content=" + content + ", commentDate=" + commentDate + ", commentEditDate=" + commentEditDate
				+ ", score=" + score + "]";
	}

	
}
