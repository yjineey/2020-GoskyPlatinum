package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.page.SearchPaging;

public interface BoardService {

	// 게시판 이름 가져오기
		public String getBoardName(Map<String, String> map);
	
	// 검색된 게시글 개수 구하기
		public int countSearch(SearchPaging searchPaging);
		
	// 리스트
		public List<BoardDTO> getSearchList(SearchPaging searchPaging);
		
	// 글
		// 글 상세 보기
		@Transactional
		public BoardDTO viewDetailBoard(Map<String, String> map);
		
		// 글 쓰기
		@Transactional
		public int addNewBoard(BoardDTO board);
		
		// 글 수정
		@Transactional
		public int updateBoard(BoardDTO board);
		
		// 글 삭제
		@Transactional
		public int deleteBoard(Map<String, String> map);
	
}
