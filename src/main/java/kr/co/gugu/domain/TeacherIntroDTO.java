package kr.co.gugu.domain;

import java.util.List;

public class TeacherIntroDTO {

	private MemberDTO member;
	private List<TeacherDTO> tlist;
	private int listSize = 0;
	
	public MemberDTO getMember() {
		return member;
	}
	
	public void setMember(MemberDTO member) {
		this.member = member;
	}
	
	public List<TeacherDTO> getTlist() {
		return tlist;
	}

	public void setTlist(List<TeacherDTO> tlist) {
		this.tlist = tlist;
		setListSize(tlist.size());
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
}
