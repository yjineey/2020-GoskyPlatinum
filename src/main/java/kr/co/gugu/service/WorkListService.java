package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import kr.co.gugu.domain.WorkListDTO;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;

public interface WorkListService {

	// 강사업무리스트 + 검색처리
	public WorkListDTO WorkList(int msno) throws Exception;
	
	// 강사 업무 상세보기
	public InterviewDTO WorkListDetail(int msno) throws Exception;
	
	// 관리자업무리스트 + 검색처리
	public List<WorkListDTO> MworkList() throws Exception;

	// 관리자 업무 상세보기
	public InterviewDTO MworkListDetail(int msno) throws Exception;
	
	// 강사 업무 작성
	public int WorkListWrite(InterviewDTO dto) throws Exception;

	//관리자 업무 진행현황
	public int WorkListStatus(Map<String, String> map) throws Exception;

	//페이징처리
	public List<WorkListDTO> Paging(Paging paging) throws Exception;
	
	//페이징처리 _전체게시글 갯수 구하기
	public int CountPaging(Paging paging) throws Exception;
	
	//검색목록
	public List<WorkListDTO> Search(SearchPaging searchPaging) throws Exception;
	
	//검색된 게시글 갯수구하기
	public int CountSearch(SearchPaging searchPaging) throws Exception;
	
	//강사 업무리스트 확인여부
	public int readchk(int msno)throws Exception;
}
