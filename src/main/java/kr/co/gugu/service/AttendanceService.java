package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;

public interface AttendanceService {

	//공통메뉴
		//pno로 출결조회하기
		public List<AttendanceDTO> getAttendance(AttendanceDTO a);
		public AttendanceDTO getAttendancemno(AttendanceDTO a);
		public AttendanceDTO getAttendanceAno(int a);
		
		//pno로 과목 저장하기(수정내용 :오전교과,오전교과내용,오후교과,오후교과내용)
		public int saveSubject(AttendanceDTO att);
		//진행중인과목검색
		public List<SubjectDTO> getSubjectList();
	
	//회원메뉴
		//이름과 생년원일로 맞는지 확인하고 맞으면 pno가져오기
		public PeopleDTO getPeople(PeopleDTO p);
		
		//출석하기 
		public int att(AttendanceDTO a);
		public int attTeacher(AttendanceDTO a);
	
	
	//강사메뉴
		
		// 강사의 해당 교과목이름(sname)과 과목코드(sno) 목록을 가져와야 함 오전,오후  총 2개 
		//호출해서 jsp페이지에 보기값 주기 String mID,String date
		public List<SubjectDTO> getSubjectfotmid(String mid);
		
		
		//강의선택 하면 해당 교과코드로 오전과목이랑 오후과목 전체검색 (과목코드라 겹치지않음)
		public List<AttendanceDTO> getAttList(AttendanceDTO a);
		
		//오전상태 입력
		public List<AttendanceDTO> setAttbeforcon(AttendanceDTO a);
		
		//오후상태입력
		public List<AttendanceDTO> setAttaftercon(AttendanceDTO a);
		
		
		
		
	//관리자메뉴
		//강사목록 가져오기
		public List<MemberDTO> getTeacherList();
		
		//불러온 리스트로 테이블에 강사 목록 넣기
		public int insertTeacher(AttendanceDTO a);
		
//		//현재 수강중인 학생리스트 가져오기
//		public List<PeopleDTO> getPeopleList(String date);
		
		//불러온 리스트로 테이블에 회원 목록 넣기
		public int insertPeople(AttendanceDTO a);
		
		
		
	// 출결 관리 2020.8.22.
		//	출결 리스트 검색
		public List<AttendanceDTO> getAttendanceListSearch(SearchPaging sp);
		
		// 출결 리스트 페이징을 위한 개수 가져오기
		public PageMaker countAttendanceListSearch(SearchPaging sp);
	
		
	// 출결 정보 가져오기 2020.8.24.
		public List<AttendanceDTO> getAttendanceListByNumber(Map<String, Object> map);
}
