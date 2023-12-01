package kr.co.gugu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.IntroDAO;
import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.SubjectDAO;
import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;

import kr.co.gugu.domain.TeacherDTO;
import kr.co.gugu.domain.TeacherIntroDTO;

@Service
public class IntroServiceImpl implements IntroService {
	@Autowired
	private IntroDAO introDAO;
	@Autowired
	private SubjectDAO subjectDAO;
	@Autowired
	private MemberDAO memberDAO;


	//醫낅ぉ 由ъ뒪�듃
	@Override
	public List<ActDTO> SIntroForm() {
		// TODO Auto-generated method stub
		return introDAO.SIntroForm();
	}


	@Override
	public List<TeacherIntroDTO> TIntroForm() {
		List<TeacherIntroDTO> list = new ArrayList<TeacherIntroDTO>();
		
		List<MemberDTO> memlist = introDAO.TIntroForm();
		
		for(MemberDTO m : memlist) {
			TeacherIntroDTO t = new TeacherIntroDTO();
			t.setMember(m);
			t.setTlist(introDAO.TIntroForm2(m.getMid()));
			list.add(t);
		}
		
		return list;
	}




}
