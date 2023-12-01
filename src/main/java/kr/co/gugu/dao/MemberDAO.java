package kr.co.gugu.dao;

import java.util.Map;

import kr.co.gugu.domain.MemberDTO;

public interface MemberDAO {

	// 회원 가입
		// 아이디 중복 체크
		public int checkDuplicatedId(String mid);
	
		// 이메일 중복 체크
		public int checkDuplicatedEmail(String memail);
	
		// 회원 추가
		public int addMember(MemberDTO dto);
		
		// 회원 추가 - SNS
		public int addMemberSNS(MemberDTO dto);
		
		// 회원 정보 가져오기 - 테스트 용
		public MemberDTO getUserInfo(String id);
		
		//회원정보 수정
		public int updateUserInfo(MemberDTO memberDTO);
				
		
		// ID 비밀번호 체크
		public int checkIdAndPassword(Map<String, String> map);
		
		// 회원 이름 가져오기
		public String getUserName(String id);
		public String getUserName(int mno);
	
		
	// 학생 - PeopleDTO
		// 학생 이름 가져오기
		public String getPeopleName(int pno);
		
		// 학생의 관리자 이름 가져오기
		public String getPeopleManagerName(int pno);
		
		
		//비번찾기
		public MemberDTO findpw(MemberDTO dto);
		
		//아이디 찾기
		public MemberDTO findId(MemberDTO memberDTO);
		
		//비번설정
		public int resetPw(MemberDTO member);

		
		
}
