package kr.co.gugu.common;

public class PagingProcess {

	private int pageNo;
	private int listSize;
	
	private int start;

	public PagingProcess() {}
	
	public PagingProcess(int pageNo, int listSize) {
		this.pageNo = pageNo;
		this.listSize = listSize;
		
		setStart((pageNo - 1) * listSize);
		
		if(start < 0)
			start = 0;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	
	
	
	
	
	private String code;
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
	

	private String items;
	private String text;
	
	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
