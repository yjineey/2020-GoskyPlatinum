package kr.co.gugu.domain;

public class ActDTO {

	private int ssno;
	private String name;
	private int room;
	private String img;
	private String intro;
	private String status;
	
	public int getSsno() {
		return ssno;
	}
	public void setSsno(int ssno) {
		this.ssno = ssno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	private String roomname;

	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	
	
	
	
}
