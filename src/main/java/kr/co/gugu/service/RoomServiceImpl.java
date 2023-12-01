package kr.co.gugu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.dao.RoomDAO;

import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.Paging;



@Service
public class RoomServiceImpl implements RoomService {
	@Inject
	RoomDAO roomDAO;
	
	@Override
	public List<RoomDTO>RoomList() throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.RoomList();
	}
	
	//강의실 등록
	@Override
	public int AddRoom(RoomDTO rDTO) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.AddRoom(rDTO);
	}

	@Override
	public List<RoomDTO> Paging(Paging paging) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.Paging(paging);
	}

	@Override
	public int CountPaging(Paging paging) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.CountPaging(paging);
	}

	@Override
	public List<RoomDTO> Search(SearchPaging searchPaging) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.Search(searchPaging);
	}
	//수정
	@Override
	public int RoomUpdate(RoomDTO roomDTO) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.RoomUpdate(roomDTO);
	}
	//삭제
	@Override
	public int RoomDelete(int roomno) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.RoomDelete(roomno);
	}

	@Override
	public RoomDTO RoomDetail(int roomno) throws Exception {
		// TODO Auto-generated method stub
		return roomDAO.RoomDetail(roomno);
	}

	

	
	

	

	


	

	

	
}
