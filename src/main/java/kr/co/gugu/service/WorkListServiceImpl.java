package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.dao.WorkListDAO;
import kr.co.gugu.dao.WorkListDAO;
import kr.co.gugu.domain.WorkListDTO;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.SearchPaging;

@Service
public class WorkListServiceImpl implements WorkListService {

	@Inject
	WorkListDAO worklistDAO;

	//강사업무 리스트
	@Override
	public WorkListDTO WorkList(int msno) throws Exception {
		return worklistDAO.WorkList(msno);
	}

	//강사업무 상세보기
	@Override
	public InterviewDTO WorkListDetail(int msno) throws Exception {
		return worklistDAO.WorkListDetail(msno);
	}
	
	//관리자 업무리스트
	@Override
	public List<WorkListDTO> MworkList() throws Exception {
		return worklistDAO.MworkList();
	}
	
	//관리자 업무 상세보기
	@Override
	public InterviewDTO MworkListDetail(int msno) throws Exception {
		return worklistDAO.MworkListDetail(msno);
	}
	
	//관리자 업무 작성
	@Override
	public int WorkListWrite(InterviewDTO dto) throws Exception {
		return worklistDAO.WorkListWrite(dto);
	}

	
	//관리자 업무 진행현황
	@Override
	public int WorkListStatus(Map<String, String> map) throws Exception {
		return worklistDAO.WorkListStatus(map);

	}
	
	@Override
	public List<WorkListDTO> Paging(kr.co.gugu.domain.Paging paging) throws Exception {
		return worklistDAO.Paging(paging);
	}

	@Override
	public int CountPaging(kr.co.gugu.domain.Paging paging) throws Exception {
		return worklistDAO.CountPaging(paging);
	}

	@Override
	public List<WorkListDTO> Search(SearchPaging searchPaging) throws Exception {
		return worklistDAO.Search(searchPaging);
		
	}

	@Override
	public int CountSearch(SearchPaging searchPaging) throws Exception {
		return worklistDAO.CountSearch(searchPaging);
	}

	@Override
	public int readchk(int msno) throws Exception {
		return worklistDAO.readchk(msno);
	}
}
