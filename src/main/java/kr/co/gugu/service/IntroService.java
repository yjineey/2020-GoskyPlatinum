package kr.co.gugu.service;

import java.util.List;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;

import kr.co.gugu.domain.TeacherDTO;
import kr.co.gugu.domain.TeacherIntroDTO;

public interface IntroService {
	
	// 醫낅ぉ 由ъ뒪�듃 媛��졇�삤湲�
	public List<ActDTO> SIntroForm();
	
	// 媛뺤궗 由ъ뒪�듃 媛��졇�삤湲�
	public List<TeacherIntroDTO> TIntroForm();
	
}
