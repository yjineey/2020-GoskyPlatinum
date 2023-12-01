package kr.co.gugu.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.ClassapplyDAO;
import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;


@Service
public class ClassapplyServiceimp implements ClassapplyService {

	
	@Inject
	private ClassapplyDAO classapplyDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public List<SubjectDTO> classlist() {
		// TODO Auto-generated method stub
		return classapplyDAO.classlist();
	}

	@Override
	public SubjectDTO classOne(int sno) {
		// TODO Auto-generated method stub
		return classapplyDAO.classOne(sno);
	}

	@Override
	public int classapply(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return classapplyDAO.classapply(classDTO);
	}

	@Override
	public List<PeopleDTO> searchpeople(String mid) {
		// TODO Auto-generated method stub
		return classapplyDAO.searchpeople(mid);
	}

	@Override
	public ActDTO searchAct(int ssort) {
		// TODO Auto-generated method stub
		return classapplyDAO.searchAct(ssort);
	}

	@Override
	public RoomDTO searchRoom(int room) {
		// TODO Auto-generated method stub
		return classapplyDAO.searchRoom(room);
	}

	@Override
	public List<PeopleDTO> searchPeople(String mid) {
		// TODO Auto-generated method stub
		return classapplyDAO.searchpeople(mid);
	}
	
	@Override
	public List<PeopleDTO> searchPeople() {
		// TODO Auto-generated method stub
		return classapplyDAO.searchPeople();
	}

	@Override
	public List<SubjectDTO> classlistbefore() {
		// TODO Auto-generated method stub
		return classapplyDAO.classlistbefore();
	}

	@Override
	public List<SubjectDTO> classlistafter() {
		// TODO Auto-generated method stub
		return classapplyDAO.classlistafter();
	}

	
	
	
	
	/*
	 * 
	 * 	2020. 08. 20. 수강 신청 현황 부분
	 * 
	 */
	
	@Override
	public List<ClassDTO> getClassApplyListSearch(SearchPaging searchPaging) {
		List<ClassDTO> list = classapplyDAO.getClassApplyListSearch(searchPaging);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMname(memberDAO.getPeopleManagerName(list.get(i).getPno()));
			list.get(i).setPname(memberDAO.getPeopleName(list.get(i).getPno()));
		}
		
		return list;
	}

	@Override
	public PageMaker getClassApplyListPage(SearchPaging searchPaging) {
		PageMaker pm = new PageMaker();
		pm.setPaging(searchPaging);
		pm.setTotalCount(classapplyDAO.countClassApplyListSearch(searchPaging));
		
		return pm;
	}

	@Override
	public int getClassApplyCardsData(SearchPaging searchPaging) {
		return classapplyDAO.countClassApplyListSearch(searchPaging);
	}

	/*
	 * 
	 * 	2020. 08. 25. 
	 * 
	 */
	
	@Override
	public SubjectDTO clistbefore(String mid) {
		// TODO Auto-generated method stub
		return classapplyDAO.clistbefore(mid);
	}

	@Override
	public SubjectDTO clisafter(String mid) {
		// TODO Auto-generated method stub
		return classapplyDAO.clisafter(mid);
	}

	@Override
	public ClassDTO getClassApply(int cano) {
		return classapplyDAO.getClassApply(cano);
	}

	@Override
	public int updateClassApply(ClassDTO dto) {
		dto.setSdate(new Timestamp(System.currentTimeMillis()));
		return classapplyDAO.updateClassApply(dto);
	}



}
