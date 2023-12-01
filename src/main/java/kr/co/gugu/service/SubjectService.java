package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;

public interface SubjectService {

	// 종목 Act
		// 종목 등록하기
		public int insertAct(ActDTO dto);
		
		// 종목 리스트 가져오기
		public List<ActDTO> getActList();
		
		// 종목 가져오기 [모든 정보]
		public ActDTO getAct(int ssno);
		
		// 종목 정보 수정하기
		public int updateAct(ActDTO dto);
		
		// 강의실 정보 가져오기
		public List<RoomDTO> getRoomList() throws Exception;
		
		// 검색 종목 리스트 가져오기
		public List<ActDTO> getActListSearch(SearchPaging searchPaging);
		
		// 검색 종목 리스트 페이지 정보 가져오기
		public PageMaker getActListPage(SearchPaging searchPaging);
		
	// 수업 Subject
		// 수업 등록 하기
		public int insertSubject(SubjectDTO dto);
	
		// 수업 정보 가져오기 [모든 정보]
		public SubjectDTO getSubject(int sno);
		
		// 수업 수정하기
		public int updateSubject(SubjectDTO dto);
	
		// 강사 정보 가져오기 By ssort
		public List<MemberDTO> getTeacherListBySsort(int ssort);
		
		// 검색 강의 리스트 가져오기
		public List<SubjectDTO> getSubjectListSearch(SearchPaging searchPaging);
				
		// 검색 강의 리스트 페이지 정보 가져오기
		public PageMaker getSubjectListPage(SearchPaging searchPaging);
}
