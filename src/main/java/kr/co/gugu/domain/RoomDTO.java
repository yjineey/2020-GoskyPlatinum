package kr.co.gugu.domain;

public class RoomDTO {

	private int roomno;
	private String content;
	private String address;
	private String rmanager;
	private String rname;
	
	
	private String post;
	private String roadAddress;
	
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRmanager() {
		return rmanager;
	}
	public void setRmanager(String rmanager) {
		this.rmanager = rmanager;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	
	
}
