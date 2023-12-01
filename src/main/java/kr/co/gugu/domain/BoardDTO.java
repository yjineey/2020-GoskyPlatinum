package kr.co.gugu.domain;

import java.sql.Timestamp;

public class BoardDTO {

	private int bno;
	private String bsort;
	private String btitle;
	private String bcontent;
	private String mid;
	private Timestamp regdate;
	private int del;
	private Timestamp deldate;
	private int readcnt;
	private String etc;
	private int cno;
	private String supload;
	private String upload;
	
	
	
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public String getSupload() {
		return supload;
	}
	public void setSupload(String supload) {
		this.supload = supload;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBsort() {
		return bsort;
	}
	public void setBsort(String bsort) {
		this.bsort = bsort;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
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
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
	
	
	private String mname;
	private int rcnt;
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	
}
