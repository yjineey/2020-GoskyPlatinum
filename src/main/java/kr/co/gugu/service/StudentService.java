package kr.co.gugu.service;

import java.util.List;

import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;

public interface StudentService {
	
	// 원생리스트 + 검색처리
	public List<MemberDTO> MemberSearch() throws Exception;

	
	//마이페이지 상세보기_ 아이디로 검색
	public MemberDTO MemberSearchId(String mid) throws Exception;
	public List<PeopleDTO> PeopleSearchId(String mid)throws Exception;
	public List<PeopleDTO> PeopleSearchId1(int pno)throws Exception;
	public List<PeopleDTO> PeopleSearchId2(PeopleDTO peopleDTO)throws Exception;
	public List<AttendanceDTO> AttendSearchId(int pno)throws Exception;
	
	//마이페이지 정보수정 상세보기
	public int MemberMypageUpdate(MemberDTO memberDTO);
	public int UserMypageUpdate(MemberDTO memberDTO);
	
	//마이페이지 정보수정
	public int PeopleMypageUpdate(PeopleDTO peopleDTO);
	public int MypageInfoUpdate(PeopleDTO peopleDTO);
	
	//원생추가
	public int PeopleAdd(PeopleDTO peopleDTO) throws Exception;
	
	//페이징처리
	public List<MemberDTO> Paging(Paging paging) throws Exception;
	
	//페이징처리 _전체게시글 갯수 구하기
	public int CountPaging(Paging paging) throws Exception;
	
	//검색목록
	public List<MemberDTO> Search(SearchPaging searchPaging) throws Exception;
	public List<MemberDTO> UserSearch(SearchPaging searchPaging) throws Exception;
	
	//검색된 게시글 갯수구하기
	public int CountSearch(SearchPaging searchPaging) throws Exception;
	public int UserCountSearch(SearchPaging searchPaging) throws Exception;

	//원생삭제
	public int MemberDelete(int mno) throws Exception;
}
