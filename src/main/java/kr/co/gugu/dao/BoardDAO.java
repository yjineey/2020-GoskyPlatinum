package kr.co.gugu.dao;

import java.util.List;

import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.page.SearchPaging;

public interface BoardDAO {

	// 게시판 이름 가져오기
		public String getBoardName(String bsort);
	
	//검색된 게시글 갯수구하기
		public int getCountSearchPaging(SearchPaging searchPaging);
		
	// 리스트
		// 전체 글 갯수
		public int countBoardList(String bsort);
		
		// 해당 게시판 목록 가져오기
		public List<BoardDTO> getSearchList(SearchPaging searchPaging);
	
	// 글
		// 상세 보기
		public BoardDTO getBoardByBno(int bno);
	
		// 글 쓰기
		public int insertBoard(BoardDTO dto);
	
		// 조회수 증가
		public int updateReadcnt(int bno);
	
		// 글 수정
		public int updateBoard(BoardDTO dto);
	
		// 글 삭제
		public int deleteBoard(int bno);
	
}
