package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import kr.co.gugu.domain.ReplyDTO;

public interface ReplyService {

	// 댓글
		// 댓글 리스트 가져오기
		public List<ReplyDTO> getReplyList(Map<String, String> map);
	
		// 댓글 가져오기
		public ReplyDTO getReply(Map<String, String> map);
	
		// 댓글 추가
		public int insertReply(ReplyDTO dto);
	
		// 댓글 수정
		public int updateReply(ReplyDTO dto);
	
		// 댓글 삭제
		public int deleteReply(Map<String, String> map);
	
}
