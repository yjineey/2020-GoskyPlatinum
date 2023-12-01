package kr.co.gugu.page;

public class Paging {

	private int page;					//현재 페이지 번호
	private int perPageNum;				//페이지당 출력되는 갯수
	
	public Paging() {
		this.page=1;
		this.perPageNum=10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum>100) {
			this.perPageNum=10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return(this.page-1)*perPageNum;
	}
	
	
}
