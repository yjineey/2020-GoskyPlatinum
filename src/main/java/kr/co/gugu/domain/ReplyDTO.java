package kr.co.gugu.domain;

import java.sql.Timestamp;

public class ReplyDTO {
	
	private int rno;
	private int bno;
	private String content;
	private String mid;
	private Timestamp regdate;
	private int del;
	private Timestamp deldate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public Timestamp getDeldate() {
		return deldate;
	}
	public void setDeldate(Timestamp deldate) {
		this.deldate = deldate;
	}
	
	private String mname;

	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	
}
