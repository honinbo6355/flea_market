package egovframework.market.cmmn.service.util;

public class PagingVO {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;	
	private SearchVO search;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		pageInfo();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public SearchVO getSearch() {
		return search;
	}

	public void setSearch(SearchVO search) {
		this.search = search;
	}
	
	private void pageInfo() {
		this.endPage = (int)Math.ceil((this.search.getPage() / (double)this.displayPageNum)) * displayPageNum;
		this.startPage = (this.endPage - this.displayPageNum) + 1;
		
		int tempEndPage = (int)Math.ceil(this.totalCount / (double)this.search.getPerPageNum());
		
		if (this.endPage > tempEndPage)
			this.endPage = tempEndPage;
		
		this.prev = this.startPage == 1 ? false : true;
		this.next = this.totalCount > this.endPage * this.search.getPerPageNum() ? true : false;
	}
}
