package kr.co.gugu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.page.SearchPaging;

@Repository
public class BoardDaoImpl implements BoardDAO{

	private final String namespace = "mappers.BoardMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String getBoardName(String bsort) {
		return sqlSession.selectOne(namespace + ".getBoardName", bsort);
	}
	
	@Override
	public int getCountSearchPaging(SearchPaging searchPaging) {
		return sqlSession.selectOne(namespace+".getCountSearchPaging",searchPaging);
	}
	
	/**
	 * 
	 *  리스트
	 *  
	 */
	
	
	@Override
	public int countBoardList(String bsort) {
		return sqlSession.selectOne(namespace + ".countListByBsort", bsort);
	}
	
	@Override
	public List<BoardDTO> getSearchList(SearchPaging searchPaging) {
		return sqlSession.selectList(namespace+".getSearchList", searchPaging);
	}
	
	
	/**
	 * 
	 *  글
	 *  
	 */
	
	@Override
	public BoardDTO getBoardByBno(int bno) {
		return sqlSession.selectOne(namespace + ".getBoardByBno", bno);
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return sqlSession.insert(namespace + ".insertBoard", dto);
	}

	@Override
	public int updateReadcnt(int bno) {
		return sqlSession.update(namespace + ".updateReadcnt", bno);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return sqlSession.update(namespace + ".updateBoard", dto);
	}

	@Override
	public int deleteBoard(int bno) {
		return sqlSession.update(namespace + ".deleteBoard", bno);
	}







	

}
