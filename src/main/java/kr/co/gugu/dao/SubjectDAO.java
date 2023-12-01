package kr.co.gugu.dao;

import java.util.List;
import java.util.Map;

import kr.co.gugu.common.PagingProcess;
import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.SearchPaging;

public interface SubjectDAO {

	// 종목
		// 종목 등록
		public int insertAct(ActDTO dto);
	
		// 종목 리스트
		public List<ActDTO> getActList();
		
		// 종목 이름 가져오기
		public String getActName(int ssno);
		
		// 종목 가져오기 [모든 정보]
		public ActDTO getAct(int ssno);
		
		// 종목 정보 수정 
		public int updateAct(ActDTO dto);
		
		// 검색 종목 리스트 가져오기
		public List<ActDTO> getActListSearch(SearchPaging searchPaging);
		
		// 검색 종목 리스트 글 개수 가져오기
		public int countActListSearch(SearchPaging searchPaging);
	
	// 강의
		// 강의 등록
		public int insertSubject(SubjectDTO dto);

		// 리스트 가져오기
		public List<SubjectDTO> getSubjectList();
	
		// 강의 정보 가져오기
		public SubjectDTO getSubject(int sno);
	
		// 강의 정보 수정
		public int updateSubject(SubjectDTO dto);
	
		// 강사 정보 가져오기 by ssort
		public List<MemberDTO> getTeacherListBySsort(int ssort);
		
		// 검색 강의 리스트 가져오기
		public List<SubjectDTO> getSubjectListSearch(SearchPaging searchPaging);
				
		// 검색 강의 리스트 글 개수 가져오기
		public int countSubjectListSearch(SearchPaging searchPaging);
		
	// 강의 인원 가져오기
	public int getSubjectPerson(int sno);
		
}
