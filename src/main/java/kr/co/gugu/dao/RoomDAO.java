package kr.co.gugu.dao;

import java.util.List;


import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SearchPaging;

public interface RoomDAO {
	
	//강의실 목록
	public List<RoomDTO> RoomList()throws Exception;
	//강의실 등록
	public int AddRoom(RoomDTO rDTO) throws Exception;

	//페이징처리
	public List<RoomDTO> Paging(Paging paging) throws Exception;
	//페이징처리 _전체게시글 갯수 구하기
	public int CountPaging(Paging paging) throws Exception;
	
	//검색목록
	public List<RoomDTO> Search(SearchPaging searchPaging) throws Exception;
	
	//강의실 상세정보 보기
	public RoomDTO RoomDetail(int roomno) throws Exception;
	
	//강의실 상세정보 수정
	public int RoomUpdate(RoomDTO roomDTO) throws Exception;
		
	//강의실 상세정보 삭제
	public int RoomDelete(int roomno) throws Exception;
	
	// 강의실 이름 가져오기
	public String getRoomName(int roomno);
}
