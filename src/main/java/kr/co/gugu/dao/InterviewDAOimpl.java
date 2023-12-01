package kr.co.gugu.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.InterviewReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;

@Repository
public class InterviewDAOimpl implements InterviewDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String i="mappers.InterviewMapper";
	
	@Override
	public List<InterviewDTO> searchinterviewlist(Search search) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".searchinterview",search);
	}
	@Override
	public List<InterviewDTO> receivedinterviewlist(String fromid) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".receivedinterviewlist",fromid);
	}

	@Override
	public InterviewDTO receivedinterviewdetail(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".receivedinterviewdetail",msno);
	}

	@Override
	public int sendinterview(InterviewDTO interviewDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(i+".sendinterview",interviewDTO);
	}

	
	
//	//받은상담 리스트 조회
//	@Override
//	public List<InterviewDTO> sendinterviewlist(String toid, Pagination pagination) {
//		// TODO Auto-generated method stub
//		return sqlsession.selectList(i+".sendinterviewlist",toid,paginatoin);
//	}
	
	
	//받은상담 리스트 조회
	@Override
	public List<InterviewDTO> sendinterviewlist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".sendinterviewlist",pagination);
	}


	
	
	
	
	
	
	@Override
	public InterviewDTO sendinterviewdetail(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".sendinterviewdetail",msno);
	}

	@Override
	public int sendinterviewdell(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".sendinterviewdell",msno);
	}

	@Override
	public List<InterviewDTO> delinterviewlist(String toid) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".delinterviewlist",toid);
	}

	@Override
	public int delinterview(String toid) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delinterview",toid);
	}
	@Override
	public int receivedinterviewCnt(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".receivedlistCnt",pagination);
	}
	@Override
	public int sendinterviewCnt(String toid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".sendlistCnt",toid);
	}
	@Override
	public int delinterviewCnt(String toid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".dellistCnt",toid);
	}
	@Override
	public int sendinterviewCnt() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".sendlistCnt");
	}
	@Override
	public int delinterviewCnt() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".dellistCnt");
	}
	@Override
	public List<InterviewDTO> delinterviewlist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".delinterviewlist",pagination);
	}
	
	
	
//댓글	
	@Override
	public int replywrite(InterviewReply InterviewReply) {
		// TODO Auto-generated method stub
		return sqlsession.insert(i+".replywrite",InterviewReply);
	}
	
	@Override
	public List<InterviewReply> interviewreplyList(int bno) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".interviewreplylist",bno);
	}
	
	@Override
	public int replyUpdate(InterviewReply InterviewReply) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".replyupdate",InterviewReply);
	}
	
	@Override
	public int replyDel(int rno) {
		// TODO Auto-generated method stub
		return sqlsession.delete(i+".replydel",rno);
	}
	
	@Override
	public InterviewReply replyOne(int rno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".interviewreplyOne",rno);
	}
	
	@Override
	public int replydelete(int rno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".replydelete");
	}
	
	@Override
	public int replydelete2(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int interviewUpdate(InterviewDTO interviewDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".update",interviewDTO);
	}
	
	@Override
	public int interviewDel(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delete",msno);
	}
	@Override
	public int searchCnt(Search search) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".searchCnt",search);
	}
	
	
	@Override
	public List<InterviewDTO> receivedinterviewlist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".receivedinterviewlist",pagination);
	}

	
	
}
