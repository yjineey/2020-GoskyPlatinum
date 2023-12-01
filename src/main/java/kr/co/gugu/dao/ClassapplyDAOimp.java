package kr.co.gugu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.SearchPaging;

@Repository
public class ClassapplyDAOimp implements ClassapplyDAO{

	@Inject
	private SqlSession sqlsession;
	private static final String c="mappers.ClassApplyMapper";
	
	
	
	@Override
	public List<SubjectDTO> classlist() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".classlist");
	}

	

	@Override
	public SubjectDTO classOne(int sno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(c+".classOne",sno);
	}

	@Override
	public int classapply(ClassDTO classDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(c+".classapply",classDTO);
	}

	@Override
	public List<PeopleDTO> searchpeople(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".searchpeople",mid);
	}



	@Override
	public ActDTO searchAct(int ssort) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(c+".searchAct",ssort);
	}



	@Override
	public RoomDTO searchRoom(int room) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(c+".searchRoom",room);
	}



	@Override
	public List<PeopleDTO> searchPeople(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".searchPeople",mid);
	}
	
	@Override
	public List<PeopleDTO> searchPeople() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".searchpeople2");
	}



	@Override
	public List<SubjectDTO> classlistbefore() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".classlistbefore");
	}



	@Override
	public List<SubjectDTO> classlistafter() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(c+".classlistafter");
	}



	/*
	 * 
	 * 		2020-08-20
	 * 
	 */
	
	@Override
	public List<ClassDTO> getClassApplyListSearch(SearchPaging searchPaging) {
		return sqlsession.selectList(c+".getClassApplyListSearch", searchPaging);
	}

	@Override
	public int countClassApplyListSearch(SearchPaging searchPaging) {
		return sqlsession.selectOne(c+".countClassApplyListSearch", searchPaging);
	}

	/*
	 * 
	 * 		2020-08-25
	 * 
	 */

	@Override
	public SubjectDTO clistbefore(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(c+".clistbefore",mid);
	}

	@Override
	public SubjectDTO clisafter(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(c+".clistafter",mid);
	}

	@Override
	public ClassDTO getClassApply(int cano) {
		return sqlsession.selectOne(c+".getClassApply", cano);
	}

	@Override
	public int updateClassApply(ClassDTO dto) {
		return sqlsession.update(c+".updateClassApply", dto);
	}



	
	
}
