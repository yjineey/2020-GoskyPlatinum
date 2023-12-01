package kr.co.gugu.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.SearchPaging;

@Repository
public class AttendanceDAOimp implements AttendanceDAO{

	@Inject
	private SqlSession sqlsession;
	private static final String t="mappers.AttendanceMapper";
	
	@Override
	public List<AttendanceDTO> getAttendance(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getAttendance",a);
	}
	@Override
	public AttendanceDTO getAttendancemno(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(t+".getAttendancemno",a);
	}
	
	
	@Override
	public int saveSubject(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.update(t+".saveSubject",a);
	}
	@Override
	public List<SubjectDTO> getSubjectList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getSubjectList");
	}
	@Override
	public PeopleDTO getPeople(PeopleDTO p) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(t+".getPeople",p);
	}
	@Override
	public int att(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.update(t+".att",a);
	}
	@Override
	public int attteacher(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.update(t+".attTeacher",a);
	}
	@Override
	public List<SubjectDTO> getSubjectfotmid(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getSubjectfrommid",mid);
	}
	@Override
	public List<AttendanceDTO> getAttList(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getAttList",a);
	}
	@Override
	public List<AttendanceDTO> setAttbeforcon(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".setAttbeforcon",a);
	}
	@Override
	public List<AttendanceDTO> setAttaftercon(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".setAttaftercon",a);
	}
	@Override
	public List<MemberDTO> getTeacherList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getTeacherList");
	}
	@Override
	public int insertTeacher(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.insert(t+".teacherInsert",a);
	}
	@Override
	public List<ClassDTO> getPeopleList(String date) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(t+".getPeopleList", date);
	}
	@Override
	public int insertPeople(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return sqlsession.insert(t+".PeopleInsert",a);
	}
	@Override
	public AttendanceDTO getAttendanceAno(int a) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(t+".getAttendanceAno",a);
	}
	
	
	
	
	
	@Override
	public List<AttendanceDTO> getAttendanceListSearch(SearchPaging sp) {
		return sqlsession.selectList(t+".getAttendanceListSearch", sp);
	}
	
	@Override
	public int countAttendanceListSearch(SearchPaging sp) {
		return sqlsession.selectOne(t+".countAttendanceListSearch", sp);
	}
	
	@Override
	public List<AttendanceDTO> getAttendanceListByNumber(Map<String, Object> map) {
		return sqlsession.selectList(t+".getAttendanceListByNumber", map);
	}
	
	
}
