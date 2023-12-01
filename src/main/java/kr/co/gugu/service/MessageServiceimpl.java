package kr.co.gugu.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.gugu.dao.MessageDAO;
import kr.co.gugu.domain.MessageDTO;
import kr.co.gugu.domain.MessageReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;


@Service
public class MessageServiceimpl implements MessageService {

		@Inject
		private MessageDAO messageDAO;

		@Override
		public int searchCnt(Search search) {
			// TODO Auto-generated method stub
			return messageDAO.searchCnt(search);
		}

		@Override
		public List<MessageDTO> searchmessagelist(Search search) {
			// TODO Auto-generated method stub
			return messageDAO.searchmessagelist(search);
		}

		@Override
		public int receivedmessageCnt(Pagination pagination) {
			// TODO Auto-generated method stub
			return messageDAO.receivedmessageCnt(pagination);
		}

		@Override
		public int sendmessageCnt(String toid) {
			// TODO Auto-generated method stub
			return messageDAO.sendmessageCnt(toid);
		}

		@Override
		public int delmessageCnt(String toid) {
			// TODO Auto-generated method stub
			return messageDAO.delmessageCnt(toid);
		}

		@Override
		public List<MessageDTO> receivedmessagelist(Pagination pagination) {
			// TODO Auto-generated method stub
			return messageDAO.receivedmessagelist(pagination);
		}

		@Override
		public MessageDTO receivedmessagedetail(int msno) {
			// TODO Auto-generated method stub
			return messageDAO.receivedmessagedetail(msno);
		}

		@Override
		public int receivedmessageDel(MessageDTO messageDTO) {
			// TODO Auto-generated method stub
			if(messageDTO.getFromid()!= null) {
			return messageDAO.receivedmessageDel(messageDTO);
			}
			return messageDAO.sendmessageDel(messageDTO);
			
		
		}

		@Override
		public int sendmessage(MessageDTO messageDTO) {
			// TODO Auto-generated method stub
			return messageDAO.sendmessage(messageDTO);
		}

		@Override
		public List<MessageDTO> sendmessagelist(Pagination pagination) {
			// TODO Auto-generated method stub
			return messageDAO.sendmessagelist(pagination);
		}

		@Override
		public MessageDTO sendmessagedetail(int msno) {
			// TODO Auto-generated method stub
			return messageDAO.sendmessagedetail(msno);
		}

		
		@Override
		public List<MessageDTO> delmessagelist(Pagination pagination) {
			// TODO Auto-generated method stub
			return messageDAO.delmessagelist(pagination);
		}

		@Override
		public int emptymessage(String toid) {
			// TODO Auto-generated method stub
			return messageDAO.emptymessage(toid);
		}

		@Override
		public int replywrite(MessageReply messageReply) {
			// TODO Auto-generated method stub
			return messageDAO.replywrite(messageReply);
		}

		@Override
		public List<MessageReply> messagereplyList(int bno) {
			// TODO Auto-generated method stub
			return messageDAO.messagereplyList(bno);
		}

		@Override
		public int replyUpdate(MessageReply messageReply) {
			// TODO Auto-generated method stub
			return messageDAO.replyUpdate(messageReply);
		}
	

		@Override
		public MessageReply replyOne(int rno) {
			// TODO Auto-generated method stub
			return messageDAO.replyOne(rno);
		}

		@Override
		public int replydelete(int rno) {
			// TODO Auto-generated method stub
			return messageDAO.replydelete(rno);
		}

		@Override
		public int sendmessagedell(int msno) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int delmessagecansle(int msno) {
			// TODO Auto-generated method stub
			return messageDAO.delmessagecansle(msno);
		}

		@Override
		public int delmessage2(int msno) {
			// TODO Auto-generated method stub
			return messageDAO.delmessage2(msno);
		}

	
		
	
	
	

}
