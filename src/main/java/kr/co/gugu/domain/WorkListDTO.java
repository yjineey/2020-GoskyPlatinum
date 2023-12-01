package kr.co.gugu.domain;

import java.sql.Date;

public class WorkListDTO {

	private int wno;
	private int msno;
	private String fromid;
	private int finish;
	private Date finishdate;
	
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
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
	public int getFinish() {
		return finish;
	}
	public void setFinish(int finish) {
		this.finish = finish;
	}
	public Date getFinishdate() {
		return finishdate;
	}
	public void setFinishdate(Date finishdate) {
		this.finishdate = finishdate;
	}

	
}
