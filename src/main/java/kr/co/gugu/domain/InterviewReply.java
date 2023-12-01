package kr.co.gugu.domain;

import java.util.Date;

public class InterviewReply {

	private int rno;
	private String mid;
	private String content;
	private Date redate;
	private int bno; //게시글번호
	private int del;
	private Date deldate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public Date getDeldate() {
		return deldate;
	}
	public void setDeldate(Date deldate) {
		this.deldate = deldate;
	}
	
	
	
	
	
	
}
