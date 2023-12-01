package kr.co.gugu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.PeopleDTO;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	SqlSession sqlSession;

	private String namespace = "mappers.StudentMapper";


	// 관리자업무리스트 + 검색처리
	@Override
	public List<MemberDTO> MemberSearch() throws Exception {
		return sqlSession.selectList(namespace + ".MemberList");
	}
	
	//nav 마이페이지 상세보기
	@Override
	public MemberDTO MemberDetail(int mno) throws Exception {
		return sqlSession.selectOne(namespace + ".MemberSearch", mno);
	}
	
	//마이페이지 상세보기_ 아이디로 검색
	@Override
	public MemberDTO MemberSearchId(String mid) throws Exception {
		return sqlSession.selectOne(namespace + ".MemberSearchId", mid);
	}
	
	//원생 상세보기_ 아이디로 검색
	@Override
	public List<PeopleDTO> PeopleSearchId(String mid) throws Exception {
		return sqlSession.selectList(namespace + ".PeopleSearchId", mid);
	}
	@Override
	public List<PeopleDTO> PeopleSearchId1(int pno) throws Exception {
		return sqlSession.selectList(namespace + ".PeopleSearchId1", pno);
	}
	
	//원생 상세보기_ 아이디로 검색
	@Override
	public List<PeopleDTO> PeopleSearchId2(PeopleDTO peopleDTO) throws Exception {
		return sqlSession.selectList(namespace + ".PeopleSearchId", peopleDTO);
	}
	
	//마이페이지 정보수정
	@Override
	public int MemberMypageUpdate(MemberDTO memberDTO) {
		return sqlSession.update(namespace + ".MemberMypageUpdate", memberDTO);
	}
	
	//마이페이지 정보수정
	@Override
	public int PeopleMypageUpdate(PeopleDTO peopleDTO) {
		return sqlSession.update(namespace + ".PeopleMypageUpdate", peopleDTO);
	}

	//원생삭제
	@Override
	public int MemberDelete(int mno) throws Exception {
		return sqlSession.update(namespace + ".MemberDelete", mno);
	}
	
	@Override
	public int MypageInfoUpdate(PeopleDTO peopleDTO) {
		return sqlSession.update(namespace + ".MypageInfoUpdate", peopleDTO);
	}

	//원생추가
	@Override
	public int PeopleAdd(PeopleDTO peopleDTO) throws Exception {
		return sqlSession.insert(namespace + ".PeopleAdd", peopleDTO);
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
	public int UserMypageUpdate(MemberDTO memberDTO) {
		return sqlSession.update(namespace + ".UserMypageUpdate", memberDTO);
	}

	@Override
	public List<MemberDTO> UserSearch(SearchPaging searchPaging) throws Exception {
		return sqlSession.selectList(namespace + ".UserSearch", searchPaging);
	}

	@Override
	public int UserCountSearch(SearchPaging searchPaging) throws Exception {
		return sqlSession.selectOne(namespace + ".UserSearchPaging", searchPaging);
	}

	@Override
	public List<AttendanceDTO> AttendSearchId(int pno) throws Exception {
		return sqlSession.selectList(namespace + ".AttendSearchId", pno);
	}


}
