package kr.co.gugu.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private int mno;
	private String msort;
	private String mname;
	private String mid;
	private String mpw;
	private String memail;
	private Timestamp mjoindate;
	private int mdel;
	private Timestamp mdeldate;
	private String etc;
	private String img;
	private String number;
	
	private String mpw2;
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMsort() {
		return msort;
	}
	public void setMsort(String msort) {
		this.msort = msort;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public Timestamp getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(Timestamp mjoindate) {
		this.mjoindate = mjoindate;
	}
	public int getMdel() {
		return mdel;
	}
	public void setMdel(int mdel) {
		this.mdel = mdel;
	}
	public Timestamp getMdeldate() {
		return mdeldate;
	}
	public void setMdeldate(Timestamp mdeldate) {
		this.mdeldate = mdeldate;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	public String getMpw2() {
		return mpw2;
	}
	public void setMpw2(String mpw2) {
		this.mpw2 = mpw2;
	}
	
	
	
}
