package kr.co.gugu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.ReplyDAO;
import kr.co.gugu.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<ReplyDTO> getReplyList(Map<String, String> map) {
		
		List<ReplyDTO> list = replyDAO.getReplyList(Integer.parseInt(map.get("bno")));
		
		for(int i=0; i<list.size(); i++) 
			list.get(i).setMname(memberDAO.getUserName(list.get(i).getMid()));
		
		
		return list;
	}

	@Override
	public ReplyDTO getReply(Map<String, String> map) {
		return replyDAO.getReply(Integer.parseInt(map.get("rno")));
	}

	@Override
	public int insertReply(ReplyDTO dto) {
		return replyDAO.insertReply(dto);
	}

	@Override
	public int updateReply(ReplyDTO dto) {
		return replyDAO.updateReply(dto);
	}

	@Override
	public int deleteReply(Map<String, String> map) {
		return replyDAO.deleteReply(Integer.parseInt(map.get("rno")));
	}

}
