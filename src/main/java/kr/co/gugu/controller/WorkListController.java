package kr.co.gugu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.common.LoggerAspect;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.PageMaker;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.TeacherDTO;
import kr.co.gugu.service.SubjectService;
import kr.co.gugu.service.TeacherService;
import kr.co.gugu.service.WorkListService;
import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.dao.WorkListDAO;

@Controller
public class WorkListController {

	private static final Logger logger = LoggerFactory.getLogger(WorkListController.class);
	
	@Inject
	WorkListService worklistService;
	WorkListDAO worklistDAO;
	MemberDAO memberDAO;
	
	@Autowired
	TeacherService teacherService;

	@Autowired
	SubjectService subjectService;
	
	protected Logger log = LoggerFactory.getLogger(LoggerAspect.class);

	//TODO
	// 강사검색
	@RequestMapping(value = "/TeacherInfoList", method = RequestMethod.GET)
	public String TeacherInfoList(Model model, @ModelAttribute("searchPaging") SearchPaging searchPaging)
			throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(teacherService.CountSearch(searchPaging));
		model.addAttribute("TeacherList", teacherService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);
		return "/worklist/TeacherInfoList";
	}
	
	// 강사정보보기
	@RequestMapping(value = "/TeacherInfoUpdate", method = RequestMethod.GET)
	public ModelAndView TeacherInfoUpdate(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String mid = (String) session.getAttribute("userID");
		
		mav.addObject("member", teacherService.TeacherMember(mid));
		mav.addObject("subject", teacherService.TeacherSubject(mid));
		mav.addObject("teacher", teacherService.TeacherTeacher(mid));
		
		mav.addObject("act", subjectService.getActList());
		
//		mav.addObject("teacher0", teacherService.TeacherTeacher0(mid));
//		mav.addObject("teacher1", teacherService.TeacherTeacher1(mid));
//		mav.addObject("teacher2", teacherService.TeacherTeacher2(mid));
		mav.setViewName("/worklist/TeacherInfoUpdate");
		return mav;
	}
	
	// 강사 업무리스트, 검색처리
	@RequestMapping(value = "/WorkList", method = RequestMethod.GET)
	public String WorkList(@ModelAttribute("searchPaging") SearchPaging searchPaging, Model model, HttpSession session)
			throws Exception {

		String fromid = (String) session.getAttribute("userID");
//		System.out.println(fromid);
		PageMaker pageMaker = new PageMaker();

		pageMaker.setPaging(searchPaging, fromid);
		searchPaging.setFromid(fromid);

		pageMaker.setTotalCount(worklistService.CountSearch(searchPaging));

		model.addAttribute("list", worklistService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);
//		System.out.println(fromid);
		return "/worklist/WorkList";
	}

	// 관리자아 업무리스트, 검색처리
	@RequestMapping(value = "/MworkList", method = RequestMethod.GET)
	public String MworkList(@ModelAttribute("searchPaging") SearchPaging searchPaging, Model model) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(worklistService.CountSearch(searchPaging));

		model.addAttribute("list", worklistService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);

		return "/worklist/MworkList";
	}

	// 강사 업무 상세보기
	@RequestMapping(value = "/WorkListDetail", method = RequestMethod.GET)
	public ModelAndView WorkListDetail(@RequestParam("msno") int msno, @RequestParam("fromid")String fromid,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) session.getAttribute("userID");
		
		if (fromid.equals(sessionid) ) {
			worklistService.readchk(msno);
		}
		
		mav.addObject("message", worklistService.WorkListDetail(msno));
		mav.addObject("worklist", worklistService.WorkList(msno));
		mav.setViewName("/worklist/WorkListDetail");
		return mav;
	}

	// 강사 업무 상세보기
	@RequestMapping(value = "/WorkListDetail", method = RequestMethod.POST)
	public ModelAndView WorkListDetail(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", worklistService.WorkListDetail(Integer.parseInt(map.get("msno"))));
		mav.addObject("worklist", worklistService.WorkList(Integer.parseInt(map.get("msno"))));
		mav.addObject("finish", worklistService.WorkListStatus(map));
		mav.setViewName("redirect:/WorkListDetail?msno=" + map.get("msno") + "&fromid=" + map.get("fromid"));
		return mav;
	}

	// 관리자 업무 상세보기
	@RequestMapping(value = "/MworkListDetail", method = RequestMethod.GET)
	public ModelAndView MworkListDetail(@RequestParam("msno") int msno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", worklistService.WorkListDetail(msno));
		mav.addObject("worklist", worklistService.WorkList(msno));
		mav.setViewName("/worklist/MworkListDetail");
		return mav;
	}
	
	// 관리자 업무 상세보기 + 진행현황
	@RequestMapping(value = "/MworkListDetail", method = RequestMethod.POST)
	public ModelAndView MworkListDetail(@RequestParam Map<String, String> map)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", worklistService.WorkListDetail(Integer.parseInt(map.get("msno"))));
		mav.addObject("worklist", worklistService.WorkList(Integer.parseInt(map.get("msno"))));
		mav.addObject("finish", worklistService.WorkListStatus(map));
		mav.setViewName("redirect:/MworkListDetail?msno=" + map.get("msno"));
		return mav;
	}

	// 페이징처리
	@RequestMapping(value = "/WorkListPaging", method = RequestMethod.GET)
	public String WorkListPaging(Model model, Paging paging) throws Exception {
		model.addAttribute("paging", worklistService.Paging(paging));
		return "/worklist/WorkList";
	}

	// 관리자 업무 작성
	@RequestMapping(value = "/WorkListWrite", method = RequestMethod.GET)
	public String WorkListWrite() throws Exception {
		return "/worklist/WorkListWrite";
	}

	// 관리자 업무 작성
	@RequestMapping(value = "/WorkListWrite", method = RequestMethod.POST)
	public String WorkListWrite(InterviewDTO dto, RedirectAttributes rttr, String mid) throws Exception {
		int i = worklistService.WorkListWrite(dto);
		if (i > 0) {
			rttr.addFlashAttribute("result", dto.getMsno());
			return "redirect:/MworkList";
		}
		return "/worklist/WorkListWrite";
	}
}
