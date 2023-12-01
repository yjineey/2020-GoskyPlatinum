package kr.co.gugu.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gugu.domain.MemberDTO;

public interface MemberService {

	// SNS 로그인
	public String loginForSNS(String id, HttpSession session);
	
	// 회원 가입
	public int signup(MemberDTO member);
	
	// 중복 체크 ID or Email
	public int duplicateCheck(Map<String, String> map);
	
	// ID 비밀번호 확인
	public int checkIdAndPassword(Map<String, String> map, HttpSession session);
	
	// 로그인
	public String login(MemberDTO member, HttpSession session);
	
	// 로그아웃
	public String logout(HttpSession session);
	
	// 회원 정보 가져오기 - 테스트 용
		public MemberDTO getUserInfo(String id);
		
		//회원정보 수정
		public int updateUserInfo(MemberDTO memberDTO);	
		
		
		
		

		//비번 찾기
		public MemberDTO findpw(MemberDTO dto);
		//아이디 찾기
		public MemberDTO findId(MemberDTO memberDTO);
		//비번 설정
		public int resetPw(MemberDTO member);

		
		
	
}
