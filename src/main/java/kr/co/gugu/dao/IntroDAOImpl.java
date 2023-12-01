package kr.co.gugu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;

import kr.co.gugu.domain.TeacherDTO;

@Repository

public class IntroDAOImpl implements IntroDAO {
	private final String namespace = "mappers.IntroMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	//종목 리스트
	@Override
	public List<ActDTO> SIntroForm(){
		return sqlSession.selectList(namespace + ".SIntroForm");
	}

	@Override
	public List<MemberDTO> TIntroForm() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".TIntroForm");
	}

	@Override
	public List<TeacherDTO> TIntroForm2(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".TIntroForm2", mid);
	}
}
