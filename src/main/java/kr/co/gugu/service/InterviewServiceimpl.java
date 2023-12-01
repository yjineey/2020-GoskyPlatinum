package kr.co.gugu.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.gugu.dao.InterviewDAO;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.InterviewReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;

@Service
public class InterviewServiceimpl implements InterviewService {

		@Inject
		private InterviewDAO interviewDAO;
		
	
	
	@Override
	public List<InterviewDTO> receivedinterviewlist(String fromid) {
		// TODO Auto-generated method stub
		return interviewDAO.receivedinterviewlist(fromid);
	}
	
	@Override
	public List<InterviewDTO> searchinterviewlist(Search search) {
		// TODO Auto-generated method stub
		return interviewDAO.searchinterviewlist(search);
	}

	@Override
	public InterviewDTO receivedinterviewdetail(int msno) {
		// TODO Auto-generated method stub
		return interviewDAO.receivedinterviewdetail(msno);
	}

	@Override
	public int sendinterview(InterviewDTO interviewDTO) {
		// TODO Auto-generated method stub
		return interviewDAO.sendinterview(interviewDTO);
	}

	@Override
	public List<InterviewDTO> sendinterviewlist(Pagination	pagination){
		// TODO Auto-generated method stub
		return interviewDAO.sendinterviewlist(pagination);
	}

	@Override
	public InterviewDTO sendinterviewdetail(int msno) {
		// TODO Auto-generated method stub
		return interviewDAO.sendinterviewdetail(msno);
	}

	@Override
	public int sendinterviewdell(int msno) {
		// TODO Auto-generated method stub
		return interviewDAO.sendinterviewdell(msno);
	}

	@Override
	public List<InterviewDTO> delinterviewlist(String toid) {
		// TODO Auto-generated method stub
		return interviewDAO.delinterviewlist(toid);
	}

	@Override
	public int delinterview(String toid) {
		// TODO Auto-generated method stub
		return interviewDAO.delinterview(toid);
	}
	@Override
	public int receivedinterviewCnt(Pagination pagination) {
		// TODO Auto-generated method stub
		return interviewDAO.receivedinterviewCnt(pagination);
	}
	@Override
	public int sendinterviewCnt(String toid) {
		// TODO Auto-generated method stub
		return interviewDAO.sendinterviewCnt(toid);
	}
	@Override
	public int delinterviewCnt(String toid) {
		// TODO Auto-generated method stub
		return interviewDAO.delinterviewCnt(toid);
	}

	@Override
	public int sendinterviewCnt() {
		// TODO Auto-generated method stub
		return interviewDAO.sendinterviewCnt();
	}

	@Override
	public int delinterviewCnt() {
		// TODO Auto-generated method stub
		return interviewDAO.delinterviewCnt();
	}

	@Override
	public List<InterviewDTO> delinterviewlist(Pagination pagination) {
		// TODO Auto-generated method stub
		return interviewDAO.delinterviewlist(pagination);
	}
	
//댓글
	@Override
	public int replywrite(InterviewReply InterviewReply) {
		// TODO Auto-generated method stub
		return interviewDAO.replywrite(InterviewReply);
	}

	@Override
	public List<InterviewReply> interviewreplyList(int bno) {
		// TODO Auto-generated method stub
		return interviewDAO.interviewreplyList(bno);
	}

	@Override
	public int replyUpdate(InterviewReply InterviewReply) {
		// TODO Auto-generated method stub
		return interviewDAO.replyUpdate(InterviewReply);
	}

	@Override
	public int replyDel(int rno) {
		// TODO Auto-generated method stub
		return interviewDAO.replyDel(rno);
	}

	@Override
	public InterviewReply replyOne(int rno) {
		// TODO Auto-generated method stub
		return interviewDAO.replyOne(rno);
	}

	@Override
	public int replydelete(int rno) {
		// TODO Auto-generated method stub
		return interviewDAO.replydelete(rno);
	}

	@Override
	public int replydelete2(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int interviewUpdate(InterviewDTO interviewDTO) {
		// TODO Auto-generated method stub
		return interviewDAO.interviewUpdate(interviewDTO);
	}

	@Override
	public int interviewDel(int msno) {
		// TODO Auto-generated method stub
		return interviewDAO.interviewDel(msno);
	}

	@Override
	public int searchCnt(Search search) {
		// TODO Auto-generated method stub
		return interviewDAO.searchCnt(search);
	}

	@Override
	public List<InterviewDTO> receivedinterviewlist(Pagination pagination) {
		// TODO Auto-generated method stub
		return interviewDAO.receivedinterviewlist(pagination);
	}

}
