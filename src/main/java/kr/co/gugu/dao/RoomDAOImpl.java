package kr.co.gugu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.Paging;

@Repository
public class RoomDAOImpl implements RoomDAO {
	@Inject
	SqlSession sqlSession;
	
	private String namespace = "mappers.RoomMapper";
	
	//강의실 목록
	@Override
	public List<RoomDTO> RoomList(){
		return sqlSession.selectList(namespace +".RoomList");
	}
	
	//강의실 등록
	@Override
	public int AddRoom(RoomDTO rDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace +".AddRoom", rDTO);
	}

	@Override
	public List<RoomDTO> Paging(Paging paging) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".Paging", paging);
	}


	@Override
	public int CountPaging(Paging paging) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".CountPaging", paging);
	}


	@Override
	public List<RoomDTO> Search(SearchPaging searchPaging) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".Search", searchPaging);
	}
	//수정
	@Override
	public int RoomUpdate(RoomDTO roomDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".RoomUpdate", roomDTO);
	}
	//삭제
	@Override
	public int RoomDelete(int roomno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".RoomDelete", roomno);
	}
	//상세보기

	@Override
	public RoomDTO RoomDetail(int roomno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".RoomDetail", roomno);
	}

	
	
	
	
	
	
	
	@Override
	public String getRoomName(int roomno) {
		return sqlSession.selectOne(namespace +".getRoomName", roomno);
	}


}
