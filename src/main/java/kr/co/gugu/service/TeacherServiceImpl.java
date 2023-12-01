package kr.co.gugu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import kr.co.gugu.dao.TeacherDAO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.TeacherDTO;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.SubjectDTO;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Inject
	TeacherDAO teacherDAO;

	//원생추가
	@Override
	public int TeacherAdd(MemberDTO memberDTO) {
		return teacherDAO.TeacherAdd(memberDTO);
	}

	@Override
	public MemberDTO TeacherMember(String mid) {
		return teacherDAO.TeacherMember(mid);
	}
	
	@Override
	public List<TeacherDTO> TeacherTeacher(String mid) {
		return teacherDAO.TeacherTeacher(mid);
	}
	public List<TeacherDTO> TeacherTeacher0(String mid) {
		return teacherDAO.TeacherTeacher0(mid);
	}
	@Override
	public List<TeacherDTO> TeacherTeacher1(String mid) {
		return teacherDAO.TeacherTeacher1(mid);
	}
	@Override
	public List<TeacherDTO> TeacherTeacher2(String mid) {
		return teacherDAO.TeacherTeacher2(mid);
	}

	@Override
	public List<SubjectDTO> TeacherSubject(String teacher) {
		return teacherDAO.TeacherSubject(teacher);
	}

	@Override
	public List<MemberDTO> Paging(kr.co.gugu.domain.Paging paging) throws Exception {
		return teacherDAO.Paging(paging);
	}

	@Override
	public int CountPaging(kr.co.gugu.domain.Paging paging) throws Exception {
		return teacherDAO.CountPaging(paging);
	}

	@Override
	public List<MemberDTO> Search(SearchPaging searchPaging) throws Exception {
		return teacherDAO.Search(searchPaging);
		
	}

	@Override
	public int CountSearch(SearchPaging searchPaging) throws Exception {
		return teacherDAO.CountSearch(searchPaging);
	}

	@Override
	public int MemberUpdate(MemberDTO member) {
		return teacherDAO.MemberUpdate(member);
	}
	@Override
	public int MemberUpdate2(MemberDTO member) {
		return teacherDAO.MemberUpdate2(member);
	}
	
	public int TeacherUpdate(TeacherDTO teacher) {
		return teacherDAO.TeacherUpdate(teacher);
	}

	@Override
	public int SubjectUpdate(SubjectDTO subjectDTO) {
		return teacherDAO.SubjectUpdate(subjectDTO);
	}

	@Override
	public int SubjectAdd(SubjectDTO subjectDTO) {
		return teacherDAO.SubjectAdd(subjectDTO);
	}

	@Override
	public int TeacherInfoAdd(TeacherDTO teacher) {
		return teacherDAO.TeacherInfoAdd(teacher);
	}
	@Override
	public List<MemberDTO> RequestSearch(SearchPaging searchPaging) throws Exception {
		return teacherDAO.RequestSearch(searchPaging);
	}

	@Override
	public int CountRequestSearch(SearchPaging searchPaging) throws Exception {
		return teacherDAO.CountRequestSearch(searchPaging);
	}}

