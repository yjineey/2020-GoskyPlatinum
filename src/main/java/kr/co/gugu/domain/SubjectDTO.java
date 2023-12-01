package kr.co.gugu.domain;


public class SubjectDTO {
	
	private int sno;
	private int ssort;
	private String sname;
	private int stime;
	private String mid;
	private String content;
	private int status;
	private String roomname;
	
	
	///////정현이형이 추가한것
	private String aname;
	private String mname;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getSsort() {
		return ssort;
	}
	public void setSsort(int ssort) {
		this.ssort = ssort;
	}
	
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	
	
	public int getStime() {
		return stime;
	}
	public void setStime(int stime) {
		this.stime = stime;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	

	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	
}
