package kr.co.gugu.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public String loginForSNS(String id, HttpSession session) {
		
		MemberDTO member = memberDAO.getUserInfo(id);
		session.setAttribute("mno2",member.getMno());
		session.setAttribute("userID", id);
		session.setAttribute("userName", member.getMname());
		session.setAttribute("userImg", member.getImg());
		session.setAttribute("msort", member.getMsort());
		
		setTheme(session, member.getMsort());
		
		return null;
	}

	@Override
	public int signup(MemberDTO member) {
		return memberDAO.addMember(member);
	}

	@Override
	public int duplicateCheck(Map<String, String> map) {
		if(((String) map.get("key")).equals("id"))
			return memberDAO.checkDuplicatedId(map.get("id"));
		
		return memberDAO.checkDuplicatedEmail(map.get("email"));
	}
	
	@Override
	public int checkIdAndPassword(Map<String, String> map, HttpSession session) {
		return memberDAO.checkIdAndPassword(map);
	}

	@Override
	public String login(MemberDTO member, HttpSession session) {
		member = memberDAO.getUserInfo(member.getMid());
		session.setAttribute("mno2",member.getMno());
		session.setAttribute("userID", member.getMid());
		session.setAttribute("userName", member.getMname());
		session.setAttribute("userImg", member.getImg());
		session.setAttribute("msort", member.getMsort());

		setTheme(session, member.getMsort());
		
		return null;
	}
	
	public void setTheme(HttpSession session, String msort) {
		if(msort.equals("m01"))
			session.setAttribute("bg", "bg-primary");
		else if(msort.equals("m02"))
			session.setAttribute("bg", "bg-info");
		else 
			session.setAttribute("bg", "bg-danger");
	}

	@Override
	public String logout(HttpSession session) {
		
		session.removeAttribute("userID");
		session.removeAttribute("userName");
		session.removeAttribute("userImg");
		
		
		return null;
	}

	@Override
	public MemberDTO getUserInfo(String id) {
		// TODO Auto-generated method stub
		return memberDAO.getUserInfo(id);
	}

	@Override
	public int updateUserInfo(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return memberDAO.updateUserInfo(memberDTO);
	}

	
	
	//비번찾기
	@Override
	public MemberDTO findpw(MemberDTO dto) {
		// TODO Auto-generated method stub
		return memberDAO.findpw(dto);
	}

	//아이디 찾기
	@Override
	public MemberDTO findId(MemberDTO memberDTO) {
		return memberDAO.findId(memberDTO);
	}
	//비번설정
	@Override
	public int resetPw(MemberDTO member) {
		// TODO Auto-generated method stub
		return memberDAO.resetPw(member);
	}
	


}
