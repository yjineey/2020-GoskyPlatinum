package kr.co.gugu.service;

import java.util.HashMap;
import java.util.List;

import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.InterviewReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;

public interface InterviewService {

	public int searchCnt(Search search);
	
	//게시판수정
	public int interviewUpdate(InterviewDTO interviewDTO);
	
	
	//게시판 삭제
	public int interviewDel(int msno);
	
	//받은리스트 수 계산
	public int receivedinterviewCnt(Pagination pagination);
	
	//보낸리스트 수 계산
		public int sendinterviewCnt(String toid);
		//보낸리스트 수 계산
		public int sendinterviewCnt();
		
	//휴지통 리스트
		
		public int delinterviewCnt(String toid);
		public int delinterviewCnt();
		
	
	//받은상담리스트
		public List<InterviewDTO> receivedinterviewlist(String fromid) ;
		
		
		public List<InterviewDTO> searchinterviewlist(Search search);
		public List<InterviewDTO> receivedinterviewlist(Pagination pagination);
		
	//받은상감 디테일
		public InterviewDTO receivedinterviewdetail(int msno) ;
		
		
	//상담신청
		public int sendinterview(InterviewDTO interviewDTO) ;
		
		
	//상담내역리스트
		public List<InterviewDTO> sendinterviewlist(Pagination pagination);
		
		
	//상담내역디테일
		public InterviewDTO sendinterviewdetail(int msno) ;
		
	//상담삭제
		public int sendinterviewdell(int msno) ;
		
	//상담휴지통리스트
		public List<InterviewDTO> delinterviewlist(String toid);
		
		public List<InterviewDTO> delinterviewlist(Pagination pagination);
		
		
	//상담휴지통 비우기
		public int delinterview(String toid) ;
		
		
		//댓글 쓰기
				public int replywrite(InterviewReply InterviewReply);
				
				//게시물 번호애 해당하는 댓글  가져오기
				public List<InterviewReply> interviewreplyList(int bno);
				
				//댓글수정을 위한 메소드
				public int replyUpdate(InterviewReply InterviewReply);
				
				//댓글 삭제를 위한 메소드
				public int replyDel(int rno);
				
				//댓글 하나조회
				public InterviewReply replyOne(int rno);
				
				//댓글삭제 del1
				public int replydelete(int rno);

				//댓글삭제 
				public int replydelete2(int rno);
				
				
		
}
