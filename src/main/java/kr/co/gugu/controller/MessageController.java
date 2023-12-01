package kr.co.gugu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPBinding;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.domain.MessageDTO;
import kr.co.gugu.domain.MessageReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;
import kr.co.gugu.service.InterviewService;
import kr.co.gugu.service.MessageService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MessageController {

	@Inject
	private MessageService messageService;
	

	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	
	
//search						  searchmessage
		@RequestMapping(value = "/searchmessagelist", method = RequestMethod.GET)
		public String searchmessage(HttpSession session, Model model,
				@RequestParam(required = false, defaultValue = "1") int page,
				@RequestParam(required = false, defaultValue = "1") int range,
				@RequestParam(required = false, defaultValue = "title") String searchType
				, @RequestParam(required = false) String keyword){
			
		
			Search search = new Search();

			search.setSearchType(searchType);

			search.setKeyword(keyword);
			search.setToid((String) session.getAttribute("userID"));
			// 게시글수 조회
	
			int listCnt = messageService.searchCnt(search);
			
			search.pageInfo(page, range, listCnt);

			
			

			// 값 정송하기
			model.addAttribute("pagination", search);
 			model.addAttribute("list", messageService.searchmessagelist(search));
			return "message/searchmessagelist";

		}
	

	
	// 받은 메세지list
	@RequestMapping(value = "receivedmessagelist", method = RequestMethod.GET)
	public String receivedmessage(HttpSession session, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword){
		//세션에서 아이디받아서 fromid넣어주기
		String fromid= (String) session.getAttribute("userID");
		
		
		Pagination pagination = new Pagination();
		pagination.setToid(fromid);
		int listCnt = messageService.receivedmessageCnt(pagination);
		
		
		
		pagination.pageInfo(page, range, listCnt,fromid);
		
	
		// 게시글수 조회
		

		// 값 정송하기
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", messageService.receivedmessagelist(pagination));
		return "/message/receivedmessagelist";

	}

	
	// detail
	@RequestMapping(value = "/messagedetail", method = RequestMethod.GET)
	public String messageDetail(@RequestParam("msno") int msno, Model model) {
 
		model.addAttribute("detail", messageService.receivedmessagedetail(msno));
		return "/message/messageDetail";

	}
	
	
	// 보낸메세지detail
		@RequestMapping(value = "/sendmessagedetail", method = RequestMethod.GET)
		public String sendmessageDetail(@RequestParam("msno") int msno, Model model) {
	 
			model.addAttribute("detail", messageService.receivedmessagedetail(msno));
			return "/message/sendmessageDetail";

		}
	
	
	

	// 메세지 작성하기get
	@RequestMapping(value = "/sendmessage", method = RequestMethod.GET)
	public String sendmessage() {

		return "/message/sendmessage";

	}
	// 메세지 작성하기POST
		@RequestMapping(value = "/sendmessage", method = RequestMethod.POST)
		public String sendmessage(Model model, MessageDTO messageDTO) {
			
			messageService.sendmessage(messageDTO);
			
	 		return "redirect:/sendmessagelist";
		}
		
		
	// 메세지 답장하기get
		@RequestMapping(value = "/rmessage", method = RequestMethod.GET)
		public String rmessage(@RequestParam("toid")String fromid, Model model) {
			
			
			model.addAttribute("fromid",fromid);
			return "/message/sendmessage";

		}

		
		
	// 메세지 답장하기POST
		@RequestMapping(value = "/rmessage", method = RequestMethod.POST)
		public String rmessage(Model model, MessageDTO messageDTO) {
			
			messageService.sendmessage(messageDTO);
			
	 		return "/message/receivedmessagelist";
		}

		
	

	// 보낸메세지보기list
	@RequestMapping(value = "/sendmessagelist", method = RequestMethod.GET)
	public String sendinterviewlist(Locale locale, Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		String toid = (String) session.getAttribute("userID");
		int listCnt = messageService.sendmessageCnt(toid);
		logger.info("toid :", toid);
		logger.info("listCnt :", listCnt);

		// 페이징 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt, toid);

		model.addAttribute("pagination", pagination);
		// model.addAttribute("list", interviewService.sendinterviewlist(map));
		model.addAttribute("list", messageService.sendmessagelist(pagination));
		return "/message/sendmessagelist";

	}

	
	

	// 받은메세지삭제
	@RequestMapping(value = "/message/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("msno") int msno,
			@RequestParam("type")String type,RedirectAttributes rttr) {
	
		
		MessageDTO messageDTO=new MessageDTO();
		messageDTO.setMsno(msno);
		
		if(type.contains("received")) {
			messageDTO.setFromid(type);
			
		}else {
			messageDTO.setToid(type);
		}

		int r = messageService.receivedmessageDel(messageDTO);
		if (r > 0) {
			rttr.addFlashAttribute("msg", "글삭제성공");
			return "redirect:../receivedmessagelist";
		}

		return "redirect:../messagedetail?msno=" + msno;
	}
	
	
	
	

	//메세지 휴지통
	@RequestMapping(value = "/delmessagelist", method = RequestMethod.GET)
	public String delinterviewlist(Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		String fromid = (String) session.getAttribute("userID");
		
		int listCnt = messageService.delmessageCnt(fromid);

		// 페이징 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt, fromid);


		model.addAttribute("pagination", pagination);
		model.addAttribute("list", messageService.delmessagelist(pagination));

		return "/message/delmessagelist";

	}
	

	// 삭제디테일
	@RequestMapping(value = "/delmessagedetail", method = RequestMethod.GET)
	public String delmessageDetail(@RequestParam("msno") int msno, Model model) {
 
		model.addAttribute("detail", messageService.receivedmessagedetail(msno));
		return "/message/delmessageDetail";

	}
	
	//삭제취소
	@RequestMapping(value = "/delmessagecansle", method = RequestMethod.GET)
	public String delmessagecansle(@RequestParam("msno") int msno, Model model) {
 
		messageService.delmessagecansle(msno);
		
			
		
		return "redirect:delmessagelist";

	}
	
	//완전삭제
	@RequestMapping(value = "/delete2", method = RequestMethod.GET)
	public String messsage2(@RequestParam("msno") int msno, Model model) {
 
		messageService.delmessage2(msno);
		
			
		
		return "redirect:delmessagelist";

	}
	
	
	

//상담내역 휴지통비우기
	@RequestMapping(value = "/emptymessage", method = RequestMethod.GET)
	public String delinterview(HttpSession session,Locale locale, Model model) {
		String toid= (String) session.getAttribute("userID");
		
		messageService.emptymessage(toid);
		

		return "/message/delmessagelist";

	}

//댓글////////////////////////////////////////	

	// 아작스 댓글은 매핑 따로줘서 불러온다
	@ResponseBody
	@RequestMapping(value = "message/replylist", method = RequestMethod.POST)
	public List<MessageReply> replylist(@RequestParam("msno") int bno) {
		return messageService.messagereplyList(bno);
	}

	// 댓글쓰기
	@ResponseBody
	@RequestMapping(value = "message/replywrite", method = RequestMethod.POST)
	public Map<String, Object> replywrite(MessageReply messageReply) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			messageService.replywrite(messageReply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "Fail");
		}

		return result;
	}

	
	// 아작스 댓글 수정
	@ResponseBody
	@RequestMapping(value = "message/replyupdate", method = RequestMethod.POST)
	public List<MessageReply> replyupdate(MessageReply messageReply, RedirectAttributes rttr) {
		 messageService.replyUpdate(messageReply);
		
		return messageService.messagereplyList(messageReply.getBno());

	}



	// 아작스 댓글 삭제del=1
	@ResponseBody
	@RequestMapping(value = "message/replydelete", method = RequestMethod.POST)
	public Map<String, Object> replydelete(@RequestParam("msno") int rno, MessageReply messageReply,
			RedirectAttributes rttr) {

		Map<String, Object> result = new HashMap<String, Object>();
 		try {
			int r = messageService.replydelete(rno);

			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}

		return result;

	}

}
