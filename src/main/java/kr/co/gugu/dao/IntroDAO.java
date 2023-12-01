package kr.co.gugu.dao;

import java.util.List;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;

import kr.co.gugu.domain.TeacherDTO;

public interface IntroDAO {
	
	// 종목 리스트
	public List<ActDTO> SIntroForm();
	
	// 강사 리스트
	public List<MemberDTO> TIntroForm();
	
	//강사 약력 리스트
	public List <TeacherDTO> TIntroForm2(String mid);

}
