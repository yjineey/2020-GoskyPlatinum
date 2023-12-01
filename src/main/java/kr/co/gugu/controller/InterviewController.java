package kr.co.gugu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.InterviewReply;
import kr.co.gugu.domain.Pagination;
import kr.co.gugu.domain.Search;
import kr.co.gugu.service.InterviewService;
import kr.co.gugu.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class InterviewController {

	@Inject
	private InterviewService interviewService;
	@Inject
	private MessageService messageService;

	private static final Logger logger = LoggerFactory.getLogger(InterviewController.class);

	
	
//search
		@RequestMapping(value = "/searchinterview", method = RequestMethod.GET)
		public String searchinterview(String fromid, Model model,
				@RequestParam(required = false, defaultValue = "1") int page,
				@RequestParam(required = false, defaultValue = "1") int range,
				@RequestParam(required = false, defaultValue = "title") String searchType
				, @RequestParam(required = false) String keyword){
			
			
			Search search = new Search();

			search.setSearchType(searchType);

			search.setKeyword(keyword);

			// 게시글수 조회
			int listCnt = interviewService.searchCnt(search);
			
			search.pageInfo(page, range, listCnt);

			
			

			// 값 정송하기
			model.addAttribute("pagination", search);
			model.addAttribute("list", interviewService.searchinterviewlist(search));
			return "/interview/searchinterviewlist";

		}
	
	
	
	// 관리자용 받은상담list
	@RequestMapping(value = "/receivedinterview", method = RequestMethod.GET)
	public String receivedinterview(String fromid, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword,
			HttpSession session)
 {
		String msort=	(String)session.getAttribute("msort");
		String toid = (String) session.getAttribute("userID");
		
			
		Search search = new Search();

		search.setSearchType(searchType);

		search.setKeyword(keyword);
		
		if(msort.equals("m03") ) {
			System.out.println("관리자같아요"+msort);
		
		// 게시글수 조회
		int listCnt = interviewService.receivedinterviewCnt(search);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		//msort 확인하고 상황에 따라 나누어주기

		
		
		// 값 정송하기
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", interviewService.receivedinterviewlist(pagination));
		model.addAttribute("session",msort);
		return "/interview/receivedinterviewlist";
		}
		
		
		else {
			System.out.println("일반인같아요"+msort);
			int listCnt = interviewService.sendinterviewCnt(toid);
			logger.info("toid :", toid);
			logger.info("listCnt :", listCnt);

			// 페이징 객체생성
			Pagination pagination = new Pagination();
			pagination.pageInfo(page, range, listCnt, toid);

			model.addAttribute("pagination", pagination);
			// model.addAttribute("list", interviewService.sendinterviewlist(map));
			model.addAttribute("list", interviewService.sendinterviewlist(pagination));
			model.addAttribute("session",msort);
			return "/interview/sendinterviewlist";
		}
	}

	
	// 관리자용 받은상담detail
	@RequestMapping(value = "/interviewdetail", method = RequestMethod.GET)
	public String interviewDetail(@RequestParam("msno") int msno, Model model) {

		model.addAttribute("detail", interviewService.receivedinterviewdetail(msno));
		return "/interview/receivedinterviewDetail";

	}

	// 상담 작성하기get
	@RequestMapping(value = "/sendinterview", method = RequestMethod.GET)
	public String sendinterview() {

		return "/interview/sendinterview";

	}

	// 상담 작성하기POST
	@RequestMapping(value = "/sendinterview", method = RequestMethod.POST)
	public String sendinterview(Model model, InterviewDTO interviewDTO) {
		interviewService.sendinterview(interviewDTO);

		return "redirect:/sendinterviewlist";

	}

	// 상담 수정///////////////////////
	@RequestMapping(value = "/interview/update", method = RequestMethod.GET)
	public String update(@RequestParam("msno") int msno, Model model) {

		InterviewDTO interview = interviewService.sendinterviewdetail(msno);
		model.addAttribute("detail", interview);
		return "/interview/interviewUpdate";

	}

	// 상담 수정///////////////////////
	@RequestMapping(value = "/interview/update", method = RequestMethod.POST)
	public String update(InterviewDTO interviewDTO, RedirectAttributes rttr) {

		int r = interviewService.interviewUpdate(interviewDTO);
		if (r > 0) {
			// redirect할떄 메세지 주고싶다 msg에 글쓰기가 담아서 보낸다
			rttr.addFlashAttribute("msg", "수정이 완료되었습니다");

			return "redirect:../sendinterviewlist";
		}

		return "redirect:../interviewdetail?msno" + interviewDTO.getMsno();

	}

	// 상담삭제
	@RequestMapping(value = "/interview/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("msno") int msno, RedirectAttributes rttr) {
		// int r =boardService.delete(bno);

		int r = interviewService.interviewDel(msno);
		if (r > 0) {
			rttr.addFlashAttribute("msg", "글삭제성공");
			return "redirect:../sendinterviewlist";
		}

		return "redirect:../interviewdetail?msno" + msno;
	}

	// 보낸상담보기list
	@RequestMapping(value = "/sendinterviewlist", method = RequestMethod.GET)
	public String sendinterviewlist(Locale locale, Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		String toid = (String) session.getAttribute("userID");
		int listCnt = interviewService.sendinterviewCnt(toid);
		logger.info("toid :", toid);
		logger.info("listCnt :", listCnt);

		// 페이징 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt, toid);

		model.addAttribute("pagination", pagination);
		// model.addAttribute("list", interviewService.sendinterviewlist(map));
		model.addAttribute("list", interviewService.sendinterviewlist(pagination));

		return "/interview/sendinterviewlist";

	}

	//// 보낸상담보기detail 디테일 겹침
	// @RequestMapping(value = "/sendinterviewDetail", method = RequestMethod.POST)
	// public String sendinterviewDetail(Locale locale, Model model) {
	// logger.info("Welcome home! The client locale is {}.", locale);
	//
	// return "/interview/sendinterviewDetail";
	//
	// }

	// 상담내역휴지통
	@RequestMapping(value = "/delinterviewlist", method = RequestMethod.GET)
	public String delinterviewlist(Locale locale, Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String toid = (String) session.getAttribute("userID");
		int listCnt = interviewService.delinterviewCnt();

		// 페이징 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt, toid);

		// HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("pagination", pagination);
		// map.put("toid", toid);
		//

		model.addAttribute("pagination", pagination);
		// model.addAttribute("list", interviewService.sendinterviewlist(map));
		model.addAttribute("list", interviewService.delinterviewlist(pagination));

		return "/interview/delinterviewlist";

	}

//상담내역 휴지통비우기
	@RequestMapping(value = "/delinterview", method = RequestMethod.GET)
	public String delinterview(Locale locale, Model model, HttpSession session) {
		String toid= (String) session.getAttribute("userID");
		
		interviewService.delinterview(toid);
		 
		
		return "/interview/delinterviewlist";

	}
	
	// 삭제디테일
		@RequestMapping(value = "/delinterviewdetail", method = RequestMethod.GET)
		public String delmessageDetail(@RequestParam("msno") int msno, Model model) {
	 
			model.addAttribute("detail", messageService.receivedmessagedetail(msno));
			return "/interview/delinterviewDetail";

		}
	
		//삭제취소
		@RequestMapping(value = "/delinterviewcansle", method = RequestMethod.GET)
		public String delmessagecansle(@RequestParam("msno") int msno, Model model) {
	 
			messageService.delmessagecansle(msno);
			
			return "redirect:delinterviewlist";

		}
		
		//완전삭제
		@RequestMapping(value = "/idelete2", method = RequestMethod.GET)
		public String messsage2(@RequestParam("msno") int msno, Model model) {
	 
			messageService.delmessage2(msno);
			
				
			
			return "redirect:delinterviewlist";

		}
	
		
		

//댓글////////////////////////////////////////	

	// 아작스 댓글은 매핑 따로줘서 불러온다
	@ResponseBody
	@RequestMapping(value = "interview/replylist", method = RequestMethod.POST)
	public List<InterviewReply> replylist(@RequestParam("msno") int bno) {
		return interviewService.interviewreplyList(bno);
	}

	// 댓글쓰기
	@ResponseBody
	@RequestMapping(value = "interview/replywrite", method = RequestMethod.POST)
	public Map<String, Object> replywrite(InterviewReply interviewReply) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {

			interviewService.replywrite(interviewReply);

			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "Fail");
		}

		return result;
	}

	// 아작스 댓글 수정
	@ResponseBody
	@RequestMapping(value = "interview/replyupdate2", method = RequestMethod.POST)
	public List<InterviewReply> replyupdate2(InterviewReply interviewReply, RedirectAttributes rttr) {

		int r = interviewService.replyUpdate(interviewReply);
		if (r > 0) {
			return interviewService.interviewreplyList(interviewReply.getBno());
		} else {
			return interviewService.interviewreplyList(interviewReply.getBno());
		}

	}

	// 아작스 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "interview/replydelete2", method = RequestMethod.POST)
	public Map<String, Object> replydelete2(@RequestParam("msno") int msno, InterviewReply interviewReply,
			RedirectAttributes rttr) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int r = interviewService.replyDel(msno);

			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}

		return result;

	}

	// 아작스 댓글 삭제del=1
	@ResponseBody
	@RequestMapping(value = "interview/replydelete3", method = RequestMethod.POST)
	public Map<String, Object> replydelete3(@RequestParam("msno") int rno, InterviewReply interviewReply,
			RedirectAttributes rttr) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int r = interviewService.replydelete(rno);

			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}

		return result;

	}

}
