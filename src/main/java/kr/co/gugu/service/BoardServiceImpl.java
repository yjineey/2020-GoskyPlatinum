package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.BoardDAO;
import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.ReplyDAO;
import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.page.SearchPaging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private ReplyDAO replyDao;
	
	/**
	 * 
	 * 		게시판
	 * 
	 */
	
	@Override
	public String getBoardName(Map<String, String> map) {
		return boardDao.getBoardName(map.get("bsort"));
	}

	@Override
	public int countSearch(SearchPaging searchPaging) {
		return boardDao.getCountSearchPaging(searchPaging);
	}
	
	@Override
	public List<BoardDTO> getSearchList(SearchPaging searchPaging) {
		
		List<BoardDTO> list = boardDao.getSearchList(searchPaging);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMname(memberDao.getUserName(list.get(i).getMid()));
			list.get(i).setRcnt(replyDao.countReply(list.get(i).getBno()));
		}
		
		return list;
	}
	
	/**
	 * 
	 * 		글
	 * 
	 */
	
	@Override
	public BoardDTO viewDetailBoard(Map<String, String> map) {
		int bno = Integer.parseInt(map.get("bno"));
		
		BoardDTO board = boardDao.getBoardByBno(bno);
		
		boardDao.updateReadcnt(bno);
		
		board.setMname(memberDao.getUserName(board.getMid()));
		
		return board;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * 		글
	 * 
	 */
	
	@Override
	public int addNewBoard(BoardDTO board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(BoardDTO board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(Map<String, String> map) {
		return boardDao.deleteBoard(Integer.parseInt((String) map.get("bno")));
	}


}
