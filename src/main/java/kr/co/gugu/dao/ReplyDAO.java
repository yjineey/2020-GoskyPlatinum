package kr.co.gugu.dao;

import java.util.List;

import kr.co.gugu.domain.ReplyDTO;

public interface ReplyDAO {
	
	// 댓글
		// 댓글 리스트 가져오기
		public List<ReplyDTO> getReplyList(int bno);
		
		// 댓글 가져오기
		public ReplyDTO getReply(int rno);
	
		// 댓글 개수
		public int countReply(int bno);
	
		// 댓글 쓰기
		public int insertReply(ReplyDTO dto);	
	
		// 댓글 수정
		public int updateReply(ReplyDTO dto);
	
		// 댓글 삭제
		public int deleteReply(int rno);
		
}
