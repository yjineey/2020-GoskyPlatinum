package kr.co.gugu.page;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; // 전체 개시글의 갯수, DB에서 계산
	private int startPage; // 시작페이지번호, 계산식을 통한 계산
	private int endPage; // 끝 페이지 번호, 계산식을 통한 계산
	private boolean prev; // 이전링크, 계산식을 통한 계산
	private boolean next; // 다음링크, 계산식을 통한 계산
	private int displayPageNum = 10; // 하단의 페이지 번호 갯수 10개씩 표시하겠다
	
	private Paging paging;
	private String fromid;
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	// 필요한 데이터를 계산하는 계산식
	public void calcData() {
		endPage = (int) (Math.ceil(paging.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) paging.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * paging.getPerPageNum() >= totalCount ? false : true;
		
		calc2(tempEndPage);
	}

	public String makeSearch(String bsort, int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("bsort", bsort)
				.queryParam("page", page)
				.queryParam("perPageNum", paging.getPerPageNum())
				.queryParam("searchType", ((SearchPaging) paging).getSearchType())
				.queryParam("keyword", encoding(((SearchPaging) paging).getKeyword()))
				.build();

		return uriComponents.toUriString();
	}
	
	public String makeQuery(String bsort, int page) {
	    UriComponents uriComponents = UriComponentsBuilder.newInstance()
	    		.queryParam("bsort", bsort)
	            .queryParam("page", page)
	            .queryParam("perPageNum", paging.getPerPageNum())
	            .build();

	    return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
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

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging, String fromid) {
		this.paging = paging;
		this.fromid = fromid;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	
	
	public void calc2(int tempEndPage) {
		front = prev;
		last = next;
		lastPage = tempEndPage;
	}
	
	private boolean front;
	private boolean last;
	private int lastPage;
	
	public boolean isFront() {
		return front;
	}

	public void setFront(boolean front) {
		this.front = front;
	}

	public boolean isLast() {
		return last;
	}

	public void setLast(boolean last) {
		this.last = last;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
	
	
	private boolean check;

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
	
	
	
	
	
}
