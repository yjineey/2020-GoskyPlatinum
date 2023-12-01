package kr.co.gugu.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.AttendanceDAO;
import kr.co.gugu.dao.BoardDAO;
import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.ReplyDAO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDAO attendanceDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<AttendanceDTO> getAttendance(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.getAttendance(a);
	}

	@Override
	public AttendanceDTO getAttendancemno(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.getAttendancemno(a);
	}
	
	@Override
	public AttendanceDTO getAttendanceAno(int a) {
		// TODO Auto-generated method stub
		return attendanceDAO.getAttendanceAno(a);
	}


	@Override
	public int saveSubject(AttendanceDTO att) {
		// TODO Auto-generated method stub
		return attendanceDAO.saveSubject(att);
	}

	@Override
	public List<SubjectDTO> getSubjectList() {
		// TODO Auto-generated method stub
		return attendanceDAO.getSubjectList();
	}
	@Override
	public PeopleDTO getPeople(PeopleDTO p) {
		// TODO Auto-generated method stub
		return attendanceDAO.getPeople(p);
	}

	@Override
	public int att(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.att(a);
	}
	@Override
	public int attTeacher(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.attteacher(a);
	}
	@Override
	public List<SubjectDTO> getSubjectfotmid(String mid) {
		// TODO Auto-generated method stub
		return attendanceDAO.getSubjectfotmid(mid);
	}

	@Override
	public List<AttendanceDTO> getAttList(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.getAttList(a);
	}

	@Override
	public List<AttendanceDTO> setAttbeforcon(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.setAttbeforcon(a);
	}

	@Override
	public List<AttendanceDTO> setAttaftercon(AttendanceDTO a) {
		// TODO Auto-generated method stub
		return attendanceDAO.setAttaftercon(a);
	}

	@Override
	public List<MemberDTO> getTeacherList() {
		// TODO Auto-generated method stub
		return attendanceDAO.getTeacherList();
	}

	@Override
	public int insertTeacher(AttendanceDTO a) {
		// TODO Auto-generated method stub
  	 //강사리스트 불러오기
		  List<MemberDTO> mlist= attendanceDAO.getTeacherList();
		  
		  for(MemberDTO str : mlist) {
			  a.setNumber(str.getMno());
			  attendanceDAO.insertTeacher(a);
		  }

		return 1;
	}

//	@Override
//	public List<PeopleDTO> getPeopleList(String date) {
//		// TODO Auto-generated method stub
//		return attendanceDAO.getPeopleList(date);
//	}

	@Override
	public int insertPeople(AttendanceDTO a) {
		List<ClassDTO> plist = attendanceDAO.getPeopleList(month());
		for(ClassDTO str : plist) {
			a.setNumber(str.getPno());
			 attendanceDAO.insertPeople(a);
		}
		
		return 1;
	}

	public String month() {
		// 날짜입력
		int y = Calendar.getInstance().get(Calendar.YEAR);
		int m = Calendar.getInstance().get(Calendar.MONTH) + 1;
		String date = Integer.toString(y * 100 + m);
		System.out.println(date);

		return date;

	}

	
	
	
	
	@Override
	public List<AttendanceDTO> getAttendanceListSearch(SearchPaging sp) {
		List<AttendanceDTO> list = attendanceDAO.getAttendanceListSearch(sp);
		
		boolean flag = true;
		
		if(!list.isEmpty())
			flag = list.get(0).getAsort() == 1; // true >> teacher / false >> people
		
		for(int i=0; i<list.size(); i++) {
			if(flag)
				list.get(i).setName(memberDAO.getUserName(list.get(i).getNumber()));
			else
				list.get(i).setName(memberDAO.getPeopleName(list.get(i).getNumber()));
		}
		
		return list;
	}

	@Override
	public PageMaker countAttendanceListSearch(SearchPaging sp) {
		PageMaker pm = new PageMaker();
		pm.setPaging(sp);
		pm.setTotalCount(attendanceDAO.countAttendanceListSearch(sp));
		
		pm.setCheck(true);
		
		sp.setKeyword("");
		sp.setStatus("");
		if(attendanceDAO.countAttendanceListSearch(sp) > 0)
			pm.setCheck(false);
		
		return pm;
	}
	
	@Override
	public List<AttendanceDTO> getAttendanceListByNumber(Map<String, Object> map) {
		return attendanceDAO.getAttendanceListByNumber(map);
	}

}
