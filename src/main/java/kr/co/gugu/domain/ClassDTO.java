package kr.co.gugu.domain;
//cano	month	regdate	uId	status	etc	etcDate

import java.sql.Date;
import java.sql.Timestamp;

public class ClassDTO {
	
	private int cano;
	private int month;
	private Timestamp regdate;
	private int pno;
	private int status;
	private String etc;
	private Timestamp sdate;
	
	public int getCano() {
		return cano;
	}
	public void setCano(int cano) {
		this.cano = cano;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Timestamp getSdate() {
		return sdate;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}
	
	
	
	
	
	
	
	private String mname;
	private String pname;

	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	
	
}
