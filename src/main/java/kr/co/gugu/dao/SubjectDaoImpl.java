package kr.co.gugu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gugu.common.PagingProcess;
import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.SearchPaging;

@Repository
public class SubjectDaoImpl implements SubjectDAO{

	private final String namespace = "mappers.SubjectMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * 
	 * 		Act
	 * 
	 */
	
	@Override
	public int insertAct(ActDTO dto) {
		return sqlSession.insert(namespace + ".insertAct", dto);
	}
	
	@Override
	public List<ActDTO> getActList() {
		return sqlSession.selectList(namespace + ".getActList");
	}

	@Override
	public String getActName(int ssno) {
		return sqlSession.selectOne(namespace + ".getActName", ssno);
	}
	
	@Override
	public ActDTO getAct(int ssno) {
		return sqlSession.selectOne(namespace + ".getAct", ssno);
	}
	
	@Override
	public int updateAct(ActDTO dto) {
		return sqlSession.update(namespace + ".updateAct", dto);
	}
	
	@Override
	public List<ActDTO> getActListSearch(SearchPaging searchPaging) {
		return sqlSession.selectList(namespace + ".getActListSearch", searchPaging);
	}
	
	@Override
	public int countActListSearch(SearchPaging searchPaging) {
		return sqlSession.selectOne(namespace + ".countActListSearch", searchPaging);
	}
	
	
	
	/*
	 * 
	 * 		Subject
	 * 
	 */
	
	@Override
	public List<SubjectDTO> getSubjectList() {
		return sqlSession.selectList(namespace + ".getSubjectList");
	}
	
	@Override
	public SubjectDTO getSubject(int sno) {
		return sqlSession.selectOne(namespace + ".getSubject", sno);
	}
	
	@Override
	public int insertSubject(SubjectDTO dto) {
		return sqlSession.insert(namespace + ".insertSubject", dto);
	}

	@Override
	public int updateSubject(SubjectDTO dto) {
		return sqlSession.update(namespace + ".updateSubject", dto);
	}
	
	@Override
	public int getSubjectPerson(int sno) {
		return sqlSession.selectOne(namespace + ".getSubjectPerson", sno);
	}
	
	@Override
	public List<MemberDTO> getTeacherListBySsort(int ssort) {
		return sqlSession.selectList(namespace + ".getTeacherListBySsort", ssort);
	}
	
	@Override
	public List<SubjectDTO> getSubjectListSearch(SearchPaging searchPaging) {
		return sqlSession.selectList(namespace + ".getSubjectListSearch", searchPaging);
	}

	@Override
	public int countSubjectListSearch(SearchPaging searchPaging) {
		return sqlSession.selectOne(namespace + ".countSubjectListSearch", searchPaging);
	}

	

	

	

	

	

	



	






	

	

	
	
	
	
	
}
