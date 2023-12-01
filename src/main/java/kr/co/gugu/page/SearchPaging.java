package kr.co.gugu.page;

public class SearchPaging extends Paging {
	private String searchType;
	private String keyword;
	private int msno;
	private String fromid;
	private String title;
	private String content;
	private int pno;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getMsno() {
		return msno;
	}
	public void setMsno(int msno) {
		this.msno = msno;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
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
	
	
	
	
	
	
	private String bsort;

	public String getBsort() {
		return bsort;
	}
	public void setBsort(String bsort) {
		this.bsort = bsort;
	}

	
	
	
	
	private String status;
	private String stime;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	
	
	
	private String dateType;
	private int cdate;

	public String getDateType() {
		return dateType;
	}
	public void setDateType(String dateType) {
		this.dateType = dateType;
	}
	public int getCdate() {
		return cdate;
	}
	public void setCdate(int cdate) {
		this.cdate = cdate;
	}

	
	
}
