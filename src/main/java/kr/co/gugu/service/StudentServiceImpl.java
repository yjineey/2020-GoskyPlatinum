package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.dao.StudentDAO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.SearchPaging;

@Service
public class StudentServiceImpl implements StudentService {

	@Inject
	StudentDAO StudentDAO;

	// 원생리스트 + 검색처리
	@Override
	public List<MemberDTO> MemberSearch() throws Exception {
		return StudentDAO.MemberSearch();
	}
	
	//마이페이지 상세보기_ 아이디로 검색
	@Override
	public MemberDTO MemberSearchId(String mid) throws Exception {
		return StudentDAO.MemberSearchId(mid);
	}
	
	//클라이언트 상세보기_ 아이디로 검색
	@Override
	public List<PeopleDTO> PeopleSearchId(String mid) throws Exception {
		return StudentDAO.PeopleSearchId(mid);
	}
	@Override
	public List<PeopleDTO> PeopleSearchId1(int pno) throws Exception {
		return StudentDAO.PeopleSearchId1(pno);
	}
	//클라이언트 상세보기_ 아이디로 검색
	@Override
	public List<PeopleDTO> PeopleSearchId2(PeopleDTO peopleDTO) throws Exception {
		return StudentDAO.PeopleSearchId2(peopleDTO);
	}
	
	//마이페이지 정보수정
	@Override
	public int MemberMypageUpdate(MemberDTO memberDTO) {
		return StudentDAO.MemberMypageUpdate(memberDTO);
	}
	
	//마이페이지 정보수정
	@Override
	public int PeopleMypageUpdate(PeopleDTO peopleDTO) {
		return StudentDAO.PeopleMypageUpdate(peopleDTO);
	}
	@Override
	public int MypageInfoUpdate(PeopleDTO peopleDTO) {
		return StudentDAO.MypageInfoUpdate(peopleDTO);
	}
	
	//원생추가
	@Override
	public int PeopleAdd(PeopleDTO peopleDTO) throws Exception {
		return StudentDAO.PeopleAdd(peopleDTO);
	}

	@Override
	public List<MemberDTO> Paging(kr.co.gugu.domain.Paging paging) throws Exception {
		return StudentDAO.Paging(paging);
	}

	@Override
	public int CountPaging(kr.co.gugu.domain.Paging paging) throws Exception {
		return StudentDAO.CountPaging(paging);
	}

	@Override
	public List<MemberDTO> Search(SearchPaging searchPaging) throws Exception {
		return StudentDAO.Search(searchPaging);
		
	}

	@Override
	public int CountSearch(SearchPaging searchPaging) throws Exception {
		return StudentDAO.CountSearch(searchPaging);
	}
	//원생삭제
	@Override
	public int MemberDelete(int mno) throws Exception {
		return StudentDAO.MemberDelete(mno);
	}

	
	
	//TODO
	//============================================추가 ====================================================
	@Override
	public int UserMypageUpdate(MemberDTO memberDTO) {
		return StudentDAO.UserMypageUpdate(memberDTO);
	}

	@Override
	public List<MemberDTO> UserSearch(SearchPaging searchPaging) throws Exception {
		return StudentDAO.UserSearch(searchPaging);
	}

	@Override
	public int UserCountSearch(SearchPaging searchPaging) throws Exception {
		return StudentDAO.UserCountSearch(searchPaging);
	}

	@Override
	public List<AttendanceDTO> AttendSearchId(int pno) throws Exception {
		return StudentDAO.AttendSearchId(pno);
	}
}
