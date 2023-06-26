package org.kosta.toma.model;

public class Pagination {
	
	private long nowPage=1;
	private long postCountPerPage=10;
	private long pageCountPerPageGroup=5;
	private long totalPostCount;
	
	public Pagination(long totalPostCount) {
		this.totalPostCount=totalPostCount;
	}
	public Pagination(long totalPostCount,long nowPage) {
		this.totalPostCount=totalPostCount;
		this.nowPage=nowPage;
	}
	public long getNowPage() {
		return nowPage;
	}
	public long getStartRowNumber() {
		return ((nowPage - 1) * postCountPerPage) + 1;
	}
	public long getEndRowNumber() {
		long endRowNumber=this.nowPage*this.postCountPerPage;
		if(this.totalPostCount<endRowNumber)
			endRowNumber=totalPostCount;
		return endRowNumber;
	}
	public long getTotalPage() {
		long totalPage=totalPostCount / postCountPerPage;
		if(totalPostCount % postCountPerPage!=0)
			totalPage+=1;
		return totalPage;
	}
	public long getTotalPageGroup() {
		long totalPageGroup=getTotalPage()/pageCountPerPageGroup;
		if(getTotalPage()%pageCountPerPageGroup!=0)
			totalPageGroup+=1;
		return totalPageGroup;
	}
	public long getNowPageGroup() {
		long nowPageGroup=nowPage/pageCountPerPageGroup;
		if(nowPage%pageCountPerPageGroup!=0)
			nowPageGroup+=1;
		return nowPageGroup;
	}
	public long getStartPageOfPageGroup() {
		return pageCountPerPageGroup * (getNowPageGroup() - 1) + 1;
	}
	public long getEndPageOfPageGroup() {
		long endPage=getNowPageGroup()*pageCountPerPageGroup;
		if(endPage>getTotalPage())
			endPage=getTotalPage();
		return endPage;
	}
	public boolean isPreviousPageGroup() {
		boolean flag=false;
		if(getNowPageGroup()>1)
			flag=true;
		return flag;
	}
	public boolean isNextPageGroup() {
		boolean flag=false;
		if(getNowPageGroup()<getTotalPageGroup())
			flag=true;
		return flag;
	}
}