package egovframework.market.cmmn.service.util;

public class SearchVO {
	private int page; // 현재 페이지
	private int perPageNum; // 페이지당 글 갯수
	private String keyword; // 검색어
	
	public SearchVO() {
		this.page = 1;
		this.perPageNum = 5;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return (this.page - 1) * this.perPageNum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
