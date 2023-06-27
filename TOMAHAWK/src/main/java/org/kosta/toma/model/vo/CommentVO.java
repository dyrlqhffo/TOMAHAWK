package org.kosta.toma.model.vo;

public class CommentVO {
	private long commentNo;
	private MemberVO member;
	private BoardVO board;
	private ShopVO shop;
	private String commentContent;
	private String commentDate;
	private String commentEditDate;
	private long score;

	public CommentVO() {
		super();
	}

	public CommentVO(long commentNo, MemberVO member, BoardVO board, ShopVO shop, String commentContent,
			String commentDate, String commentEditDate, long score) {
		super();
		this.commentNo = commentNo;
		this.member = member;
		this.board = board;
		this.shop = shop;
		this.commentContent = commentContent;
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

	public ShopVO getShop() {
		return shop;
	}

	public void setShop(ShopVO shop) {
		this.shop = shop;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
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
		return "CommentVO [commentNo=" + commentNo + ", member=" + member + ", board=" + board + ", shop=" + shop
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + ", commentEditDate="
				+ commentEditDate + ", score=" + score + "]";
	}
}