package kr.co.gugu.service;

import java.util.HashMap;
import java.util.List;

import kr.co.gugu.domain.MessageDTO;
import kr.co.gugu.domain.MessageReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;


public interface MessageService {

	//검색	


		// 검색msg 수 계산
		public int searchCnt(Search search);
		
		//검색msg리스트
		public List<MessageDTO> searchmessagelist(Search search);
		
		
		// 받은msg 수 계산
		public int receivedmessageCnt(Pagination pagination);
		

		// 보낸msg 수 계산
		public int sendmessageCnt(String toid);


		// 휴지통 리스트수 계산

		public int delmessageCnt(String toid);

		
		// 받은msg리스트
		public List<MessageDTO> receivedmessagelist(Pagination pagination);
		
		// 받은msg 디테일
			public MessageDTO receivedmessagedetail(int msno);

		// 받은 msg 삭제
				public int receivedmessageDel(MessageDTO messageDTO);
				
		//메세지 삭제취소
		public int delmessagecansle(int msno);
				
		//메세지 단일 휴지통에서 삭제
		public int delmessage2(int msno);
	
		

		// msg보내기
		public int sendmessage(MessageDTO messageDTO);

		// 보낸msg내역리스트
		public List<MessageDTO> sendmessagelist(Pagination pagination);

		
		// 보낸msg내역디테일
		public MessageDTO sendmessagedetail(int msno);
		
		//보낸msg삭제
			public int sendmessagedell(int msno);
		
			
			
		
		// msg휴지통리스트
		public List<MessageDTO> delmessagelist(Pagination pagination);

		//msg휴지통 디테일
		//받은메세지 디테일 보여주기
		
		// 상담휴지통 비우기
		public int emptymessage(String toid);
		
		
		
		// 댓글 쓰기
		public int replywrite(MessageReply messageReply);

		// 게시물 번호애 해당하는 댓글 가져오기
		public List<MessageReply> messagereplyList(int bno);

		// 댓글수정을 위한 메소드
		public int replyUpdate(MessageReply messageReply);


		// 댓글 하나조회
		public MessageReply replyOne(int rno);

		// 댓글삭제 del
		public int replydelete(int rno);

		
				
		
}
