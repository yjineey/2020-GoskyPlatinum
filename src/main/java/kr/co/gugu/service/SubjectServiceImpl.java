package kr.co.gugu.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.RoomDAO;
import kr.co.gugu.dao.SubjectDAO;
import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDAO subjectDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private RoomDAO roomDAO;
	
	/*
	 * 
	 * 		Act
	 * 
	 */
	
	@Override
	public int insertAct(ActDTO dto) {
		return subjectDAO.insertAct(dto);
	}
	
	@Override
	public List<ActDTO> getActList() {
		return subjectDAO.getActList();
	}
	
	@Override
	public ActDTO getAct(int ssno) {
		return subjectDAO.getAct(ssno);
	}
	
	@Override
	public int updateAct(ActDTO dto) {
		return subjectDAO.updateAct(dto);
	}
	
	@Override
	public List<RoomDTO> getRoomList() throws Exception {
		return roomDAO.RoomList();
	}
	
	@Override
	public List<ActDTO> getActListSearch(SearchPaging searchPaging) {
		List<ActDTO> list = subjectDAO.getActListSearch(searchPaging);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setRoomname(roomDAO.getRoomName(list.get(i).getRoom()));
		}
		
		return list;
	}
	
	@Override
	public PageMaker getActListPage(SearchPaging searchPaging) {
		PageMaker pm = new PageMaker();
		pm.setPaging(searchPaging);
		pm.setTotalCount(subjectDAO.countActListSearch(searchPaging));
		
		return pm;
	}
	
	
	
	
	
	/*
	 * 
	 * 		Subject
	 * 
	 */
	@Override
	public int insertSubject(SubjectDTO dto) {
		return subjectDAO.insertSubject(dto);
	}

	@Override
	public SubjectDTO getSubject(int sno) {
		SubjectDTO subject = subjectDAO.getSubject(sno);
		
		subject.setAname(subjectDAO.getActName(subject.getSsort()));
		subject.setMname(memberDAO.getUserName(subject.getMid()));
		
		return subjectDAO.getSubject(sno);
	}

	@Override
	public int updateSubject(SubjectDTO dto) {
		return subjectDAO.updateSubject(dto);
	}

	@Override
	public List<MemberDTO> getTeacherListBySsort(int ssort) {
		List<MemberDTO> list = subjectDAO.getTeacherListBySsort(ssort);
		return list;
	}

	@Override
	public List<SubjectDTO> getSubjectListSearch(SearchPaging searchPaging) {
		List<SubjectDTO> list = subjectDAO.getSubjectListSearch(searchPaging);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setAname(subjectDAO.getActName(list.get(i).getSsort()));
			list.get(i).setMname(memberDAO.getUserName(list.get(i).getMid()));
		}
		
		return list;
	}

	@Override
	public PageMaker getSubjectListPage(SearchPaging searchPaging) {
		PageMaker pm = new PageMaker();
		pm.setPaging(searchPaging);
		pm.setTotalCount(subjectDAO.countSubjectListSearch(searchPaging));
		
		return pm;
	}

	

	

	



	

	
	

}
