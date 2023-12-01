package kr.co.gugu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.domain.TeacherDTO;

@Repository
public class TeacherDAOImpl implements TeacherDAO {

	@Inject
	SqlSession sqlSession;

	private String namespace = "mappers.TeacherMapper";

	@Override
	public int TeacherAdd(MemberDTO dto) {
		return sqlSession.insert(namespace + ".TeacherAdd", dto);
	}

	@Override
	public MemberDTO TeacherMember(String mid) {
		return sqlSession.selectOne(namespace + ".TeacherMember", mid);
	}
	
	@Override
	public List<TeacherDTO> TeacherTeacher(String mid) {
		return sqlSession.selectList(namespace + ".TeacherTeacher", mid);
	}
	@Override
	public List<TeacherDTO> TeacherTeacher0(String mid) {
		return sqlSession.selectList(namespace + ".TeacherTeacher0", mid);
	}
	@Override
	public List<TeacherDTO> TeacherTeacher1(String mid) {
		return sqlSession.selectList(namespace + ".TeacherTeacher1", mid);
	}
	@Override
	public List<TeacherDTO> TeacherTeacher2(String mid) {
		return sqlSession.selectList(namespace + ".TeacherTeacher2", mid);
	}

	@Override
	public List<SubjectDTO> TeacherSubject(String teacher) {
		return sqlSession.selectList(namespace + ".TeacherSubject", teacher);
	}

	@Override
	public int MemberUpdate(MemberDTO member) {
		return sqlSession.update(namespace + ".MemberUpdate", member);
	}

	@Override
	public int MemberUpdate2(MemberDTO member) {
		return sqlSession.update(namespace + ".MemberUpdate2", member);
	}

	
	@Override
	public int TeacherUpdate(TeacherDTO teacher) {
		return sqlSession.update(namespace + ".TeacherUpdate", teacher);
	} 

	@Override
	public int SubjectUpdate(SubjectDTO subjectDTO) {
		return sqlSession.update(namespace + ".SubjectUpdate", subjectDTO);
	}

	@Override
	public int SubjectAdd(SubjectDTO subjectDTO) {
		return sqlSession.insert(namespace + ".SubjectAdd", subjectDTO);
	}
	
	// 페이징처리
	@Override
	public List<MemberDTO> Paging(Paging paging) throws Exception {
		return sqlSession.selectList(namespace + ".Paging", paging);
	}

	// 페이징처리 _전체게시글 갯수 구하기
	@Override
	public int CountPaging(Paging paging) throws Exception {
		return sqlSession.selectOne(namespace + ".CountPaging", paging);
	}

	// 검색목록
	@Override
	public List<MemberDTO> Search(SearchPaging searchPaging) throws Exception {
		return sqlSession.selectList(namespace + ".Search", searchPaging);
	}

	// 검색된 게시글 갯수구하기
	@Override
	public int CountSearch(SearchPaging searchPaging) throws Exception {
			return sqlSession.selectOne(namespace + ".SearchPaging", searchPaging);
	}

	@Override
	public int TeacherInfoAdd(TeacherDTO teacher) {
		return sqlSession.insert(namespace + ".TeacherInfoAdd", teacher);
	}
	
	@Override
	public List<MemberDTO> RequestSearch(SearchPaging searchPaging) throws Exception {
		return sqlSession.selectList(namespace + ".RequestSearch", searchPaging);
	}

	@Override
	public int CountRequestSearch(SearchPaging searchPaging) throws Exception {
		return sqlSession.selectOne(namespace + ".RequestSearchPaging", searchPaging);
	}
}

