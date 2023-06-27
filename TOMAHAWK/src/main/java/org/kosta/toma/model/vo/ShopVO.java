package org.kosta.toma.model.vo;

public class ShopVO {
	private long shopNo;
	private String shopName;
	private String shopType;
	private String shopAddress;
	private MemberVO member;

	public ShopVO() {
		super();
	}

	public ShopVO(long shopNo, String shopName, String shopType, String shopAddress, MemberVO member) {
		super();
		this.shopNo = shopNo;
		this.shopName = shopName;
		this.shopType = shopType;
		this.shopAddress = shopAddress;
		this.member = member;
	}

	public long getShopNo() {
		return shopNo;
	}

	public void setShopNo(long shopNo) {
		this.shopNo = shopNo;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "ShopVO [shopNo=" + shopNo + ", shopName=" + shopName + ", shopType=" + shopType + ", shopAddress="
				+ shopAddress + ", member=" + member + "]";
	}
}
