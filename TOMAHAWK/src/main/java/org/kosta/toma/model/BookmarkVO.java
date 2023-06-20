package org.kosta.toma.model;

public class BookmarkVO {
	private long bookmarkNo;
	private MemberVO member;
	private ShopVO shop;

	public BookmarkVO() {
		super();
	}

	public BookmarkVO(long bookmarkNo, MemberVO member, ShopVO shop) {
		super();
		this.bookmarkNo = bookmarkNo;
		this.member = member;
		this.shop = shop;
	}

	public long getBookmarkNo() {
		return bookmarkNo;
	}

	public void setBookmarkNo(long bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public ShopVO getShop() {
		return shop;
	}

	public void setShop(ShopVO shop) {
		this.shop = shop;
	}

	@Override
	public String toString() {
		return "BookmarkVO [bookmarkNo=" + bookmarkNo + ", member=" + member + ", shop=" + shop + "]";
	}
}
