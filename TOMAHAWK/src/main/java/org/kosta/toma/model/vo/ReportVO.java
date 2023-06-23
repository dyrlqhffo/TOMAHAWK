package org.kosta.toma.model.vo;

public class ReportVO {
	private long reportNo;
	private BoardVO board;
	private MemberVO member;
	private String reportType;
	public ReportVO() {
		super();
	}
	public ReportVO(long reportNo, BoardVO board, MemberVO member, String reportType) {
		super();
		this.reportNo = reportNo;
		this.board = board;
		this.member = member;
		this.reportType = reportType;
	}
	public long getReportNo() {
		return reportNo;
	}
	public void setReportNo(long reportNo) {
		this.reportNo = reportNo;
	}
	public BoardVO getBoard() {
		return board;
	}
	public void setBoard(BoardVO board) {
		this.board = board;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", board=" + board + ", member=" + member + ", reportType="
				+ reportType + "]";
	}
}
