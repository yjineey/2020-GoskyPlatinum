package kr.co.gugu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.ReplyDTO;

@Repository
public class ReplyDaoImpl implements ReplyDAO{

	private final String namespace = "mappers.ReplyMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> getReplyList(int bno) {
		return sqlSession.selectList(namespace + ".getReplyList", bno);
	}

	@Override
	public ReplyDTO getReply(int rno) {
		return sqlSession.selectOne(namespace + ".getReplyOne", rno);
	}

	@Override
	public int countReply(int bno) {
		return sqlSession.selectOne(namespace + ".countReply", bno);
	}

	@Override
	public int insertReply(ReplyDTO dto) {
		return sqlSession.insert(namespace + ".insertReply", dto);
	}

	@Override
	public int updateReply(ReplyDTO dto) {
		return sqlSession.update(namespace + ".updateReply", dto);
	}

	@Override
	public int deleteReply(int rno) {
		return sqlSession.update(namespace + ".deleteReply", rno);
	}

}
