package kr.co.gugu.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.gugu.domain.MessageDTO;
import kr.co.gugu.domain.MessageReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;

@Repository
public class MessageDAOimpl implements MessageDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String i="mappers.MessageMapper";
	
	@Override
	public int searchCnt(Search search) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".searchCnt",search);
	}
	@Override
	public List<MessageDTO> searchmessagelist(Search search) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".searchMessage",search);
	}
	@Override
	public int receivedmessageCnt(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".receivedlistCnt",pagination
				);
	}
	@Override
	public int sendmessageCnt(String toid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".sendlistCnt",toid);
	}
	@Override
	public int delmessageCnt(String from) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".dellistCnt",from);
	}
	@Override
	public List<MessageDTO> receivedmessagelist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".receivedMessagelist",pagination);
	}
	@Override
	public MessageDTO receivedmessagedetail(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".receivedMessagedetail",msno);
	}
	
	
	
	@Override
	public int sendmessage(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(i+".sendMessage",messageDTO);
	}
	@Override
	public List<MessageDTO> sendmessagelist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".sendMessagelist",pagination);
	}
	@Override
	public MessageDTO sendmessagedetail(int msno) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	@Override
	public List<MessageDTO> delmessagelist(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".delMessagelist",pagination);
	}
	@Override
	public int emptymessage(String from) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delMessage",from);
	}
	@Override
	public int replywrite(MessageReply messageReply) {
		// TODO Auto-generated method stub
		return sqlsession.insert(i+".replywrite",messageReply);
	}
	@Override
	public List<MessageReply> messagereplyList(int bno) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(i+".Messagereplylist",bno);
	}
	@Override
	public MessageReply replyOne(int rno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(i+".MessagereplyOne",rno);
	}
	
	
	@Override
	public int replyUpdate(MessageReply messageReply) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".replyupdate",messageReply);
	}
	
	
	@Override
	public int replydelete(int rno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".replydelete",rno);
	}
	@Override
	public int receivedmessageDel(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delete",messageDTO);
	}
	
	@Override
	public int sendmessageDel(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".senddelete",messageDTO);
	}
	@Override
	public int delmessagecansle(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delmessagecansle",msno);
	}
	@Override
	public int delmessage2(int msno) {
		// TODO Auto-generated method stub
		return sqlsession.update(i+".delmessage2",msno);
	}
	
	
	

	
	
}
