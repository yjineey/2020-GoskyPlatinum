package kr.co.gugu.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.MemberDTO;

@Repository
public class MemberDaoImpl implements MemberDAO{

	private final String namespace = "mappers.MemberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int checkDuplicatedId(String mid) {
		return sqlSession.selectOne(namespace + ".countById", mid);
	}

	@Override
	public int checkDuplicatedEmail(String memail) {
		return sqlSession.selectOne(namespace + ".countByEmail", memail);
	}

	@Override
	public int addMember(MemberDTO dto) {
		return sqlSession.insert(namespace + ".insertMember", dto);
	}

	@Override
	public int addMemberSNS(MemberDTO dto) {
		return sqlSession.insert(namespace + ".insertMemberBySns", dto);
	}

	@Override
	public MemberDTO getUserInfo(String id) {
		return sqlSession.selectOne(namespace + ".getUserInfo", id);
	}

	@Override
	public int checkIdAndPassword(Map<String, String> map) {
		return sqlSession.selectOne(namespace + ".countByIdAndPw", map);
	}

	@Override
	public String getUserName(String id) {
		return sqlSession.selectOne(namespace + ".getUserName", id);
	}

	@Override
	public String getUserName(int mno) {
		return sqlSession.selectOne(namespace + ".getUserName2", mno);
	}
	
	@Override
	public int updateUserInfo(MemberDTO memberDTO) {
		return sqlSession.update(namespace+".updateUserInfo",memberDTO);
	}

	
	
	
	
	
	
	
	
	
	@Override
	public String getPeopleName(int pno) {
		return sqlSession.selectOne(namespace + ".getPeopleName", pno);
	}

	@Override
	public String getPeopleManagerName(int pno) {
		return sqlSession.selectOne(namespace + ".getPeopleManagerName", pno);
	}

	
	
	
		//비번찾기
			@Override
			public MemberDTO findpw(MemberDTO dto) {
				// TODO Auto-generated method stub
				return sqlSession.selectOne(namespace+".findpw", dto);
			}
			//아이디 찾기
			@Override
			public MemberDTO findId(MemberDTO memberDTO) {
				// TODO Auto-generated method stub
				return sqlSession.selectOne(namespace+".findId", memberDTO);
			}
			//비번설정
			@Override
			public int resetPw(MemberDTO member) {
				// TODO Auto-generated method stub
				return sqlSession.update(namespace +".resetPw", member);
			}
			
	
	
	
	
}
