package kr.co.gugu.service;

import java.sql.Date;
import java.util.List;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;

public interface ClassapplyService {
	
	//시간값 dto에 넣어오기
		public List<SubjectDTO> classlist();
		public List<SubjectDTO> classlistbefore();
		public SubjectDTO clistbefore(String mid);
		public SubjectDTO clisafter(String mid);
		public List<SubjectDTO> classlistafter();
		
		//과목코드로 과목정보 가져오기
		public SubjectDTO classOne(int sno);
		
		//수강신청
		public int classapply(ClassDTO classDTO);
		
		//people검색
		public List<PeopleDTO> searchpeople(String mid);
		
		//act검색
		public ActDTO searchAct(int ssort);
		
		
		//people검색
		public List<PeopleDTO> searchPeople(String mid);
		
		public List<PeopleDTO> searchPeople();
		
		
		
		//room검색
		public RoomDTO searchRoom(int room);
		
		
		
		
		/*
		 * 
		 * 	2020. 08. 20. 수강 신청 현황 부분
		 * 
		 */
		
		// 수강 신청 목록 가져오기 [검색]
		public List<ClassDTO> getClassApplyListSearch(SearchPaging searchPaging);
		
		// 수강 신청 목록 페이징 [검색]
		public PageMaker getClassApplyListPage(SearchPaging searchPaging);
		
		// 수강 신청 현황 Cards 데이터 가져오기
		public int getClassApplyCardsData(SearchPaging searchPaging);
		
		/*
		 * 
		 * 	2020. 08. 25. 수강 신청 현황 Detail
		 * 
		 */
		
		// 수강 신청 Detail
		public ClassDTO getClassApply(int cano);
				
		// 수강 신청 사항 변경
		public int updateClassApply(ClassDTO dto);
		
}
