package kr.co.gugu.dao;

import java.util.List;

import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.domain.TeacherDTO;

public interface TeacherDAO {
	// 강사추가
	public int TeacherAdd(MemberDTO member);
	
	//상세보기_회원
	public MemberDTO TeacherMember(String mid);
	
	//내 정보수정 (강사업무+강사관리)
	public List<TeacherDTO> TeacherTeacher(String mid);
	public List<TeacherDTO> TeacherTeacher0(String mid);
	public List<TeacherDTO> TeacherTeacher1(String mid);
	public List<TeacherDTO> TeacherTeacher2(String mid);
	
	// 강사업무_강사소개 추가
	public int TeacherInfoAdd(TeacherDTO teacher);

	//강사업무_과목업데이트
	public List<SubjectDTO> TeacherSubject(String teacher);

	// 강사업무_강사정보 업데이트
	public int MemberUpdate(MemberDTO member);
	public int MemberUpdate2(MemberDTO member);

	//강사업무_강사소개 업데이트
	public int TeacherUpdate(TeacherDTO teacher);

	//강사업무_과목업데이트
	public int SubjectUpdate(SubjectDTO subjectDTO);

	//강사업무_과목추가
	public int SubjectAdd(SubjectDTO subjectDTO);

	// 페이징처리
	public List<MemberDTO> Paging(Paging paging) throws Exception;

	// 페이징처리 _전체게시글 갯수 구하기
	public int CountPaging(Paging paging) throws Exception;

	// 검색목록
	public List<MemberDTO> Search(SearchPaging searchPaging) throws Exception;

	public List<MemberDTO> RequestSearch(SearchPaging searchPaging) throws Exception;

	// 검색된 게시글 갯수구하기
	public int CountSearch(SearchPaging searchPaging) throws Exception;

	public int CountRequestSearch(SearchPaging searchPaging) throws Exception;
}
