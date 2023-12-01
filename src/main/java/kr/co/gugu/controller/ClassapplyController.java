package kr.co.gugu.controller;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.ClassDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;
import kr.co.gugu.service.ClassapplyService;
import kr.co.gugu.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ClassapplyController {

	@Inject
	private ClassapplyService classapplyService;
	@Inject
	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(ClassapplyController.class);


	//수업리스트 출력 DTO
	@RequestMapping(value="/classlist", method=RequestMethod.GET)
	public String classlist(Model model) {
		System.out.println("classlist 시작");
		System.out.println("완료");
		model.addAttribute("listbefore",classapplyService.classlistbefore());
		model.addAttribute("listafter",classapplyService.classlistafter());

		return "classapply/classapplyList";
	}	

	//강사용 수업리스트 출력 오전오후하나
	@RequestMapping(value="/Clist", method=RequestMethod.GET)
	public String clist(Model model,HttpSession session) {
		System.out.println("classlist 시작");
		System.out.println("완료");
		model.addAttribute("listbefore",classapplyService.clistbefore((String)session.getAttribute("userID")));
		model.addAttribute("listafter",classapplyService.clisafter((String)session.getAttribute("userID")));

		return "teacher/cList";
	}




	//수업 상세보기 subject 테이블 내용 다가져옴
	//과목정보 가져오기 -멤버정보 가져오기 - 종목정보가져오기 - 강의실 정보 가져오기 
	@RequestMapping(value="/classOne",method=RequestMethod.GET)
	public String classOne(Model model, @RequestParam("sno")int sno) {
		//과목정보 가져오기
		SubjectDTO subject = classapplyService.classOne(sno);
		model.addAttribute("subject",subject);

		//멤버정보 가져오기(선생)
		MemberDTO member = memberService.getUserInfo(subject.getMid());
		model.addAttribute("member",member);

		//종목정보 가져오기
		ActDTO act=classapplyService.searchAct(subject.getSsort());
		model.addAttribute("act",act );


		//강의실 정보 가져오기
		RoomDTO room= classapplyService.searchRoom(act.getRoom()); 
		model.addAttribute("room",room);

		return "classapply/subjectDetail";
	}




	//수강신청페이지가기
	@RequestMapping(value="classapply",method=RequestMethod.GET)
	public String classapply(HttpSession session, Model model) {
		//유저 id로  검색해서 people리스트 보여줘야함
		String mid= (String) session.getAttribute("userID");
		System.out.println("userID:"+mid);




		model.addAttribute("people",classapplyService.searchpeople(mid));
		model.addAttribute("month",month());
		model.addAttribute("nextmonth",nextmonth());
		return "classapply/classapplyForm";
	}




	//수강신청 입력하기
	@RequestMapping(value="classapply",method=RequestMethod.POST)
	public String classapply(@RequestParam("pno")int pno,
			@RequestParam("month")int month,
			@RequestParam("etc")String etc,
			HttpSession sesson,
			RedirectAttributes rttr
			) {


		ClassDTO classDTO=new ClassDTO();
		classDTO.setPno(pno);
		classDTO.setEtc(etc);
		classDTO.setMonth(month);


		classapplyService.classapply(classDTO);

		rttr.addFlashAttribute("result");
		return "redirect:classApply/list2";
	}


	public String month() {
		//날짜입력
		int y = Calendar.getInstance().get(Calendar.YEAR);
		int m = Calendar.getInstance().get(Calendar.MONTH)+1;

		String date= Integer.toString(y*100 + m); 
		System.out.println(date);

		return date;

	}
	public String nextmonth() {
		//날짜입력
		int y = Calendar.getInstance().get(Calendar.YEAR);
		int m = Calendar.getInstance().get(Calendar.MONTH)+2;
		String date=null;

		if(m>12) {
			y++;
			m--;
		}
		date= Integer.toString(y*100 + m); 
		System.out.println(date);

		return date;

	}

	/*
	 * 
	 * 	2020. 08. 20. 수강 신청 현황 부분
	 * 
	 */

	/*
	 * 		수강 신청 현황 페이지 이동
	 */
	@RequestMapping(value="/classApply/list",method=RequestMethod.GET)
	public String goClassapplyList() {
		return "classapply/list";
	}

	@ResponseBody
	@RequestMapping(value = "/classApply/membergetListSearch", method = RequestMethod.GET)
	public List<ClassDTO> getmemberClassApplyListSearch(@ModelAttribute SearchPaging searchPaging) {
		return classapplyService.getClassApplyListSearch(searchPaging);
	}

	/*
	 * 			Get Classapply List Paging for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/classApply/membergetListPage", method = RequestMethod.GET)
	public PageMaker getmemberClassApplyListPage(@ModelAttribute SearchPaging searchPaging ) {

		return classapplyService.getClassApplyListPage(searchPaging);

	}

	@RequestMapping(value="/classApply/list2",method=RequestMethod.GET)
	public String gomemberClassapplyList(Model model,
			HttpSession session) {
		String mid= (String) session.getAttribute("userID");

		model.addAttribute("plist",classapplyService.searchpeople(mid));
		return "classapply/list2";
	}



	/*
	 * 			Get Classapply List for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/classApply/getListSearch", method = RequestMethod.GET)
	public List<ClassDTO> getClassApplyListSearch(@ModelAttribute SearchPaging searchPaging) {
		return classapplyService.getClassApplyListSearch(searchPaging);
	}

	/*
	 * 			Get Classapply List Paging for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/classApply/getListPage", method = RequestMethod.GET)
	public PageMaker getClassApplyListPage(@ModelAttribute SearchPaging searchPaging) {
		return classapplyService.getClassApplyListPage(searchPaging);
	}

	/*
	 * 			Get Classapply Cards Data for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/classApply/getCardsData", method = RequestMethod.GET)
	public int getClassApplyCardsData(@ModelAttribute SearchPaging searchPaging) {
		return classapplyService.getClassApplyCardsData(searchPaging);
	}

	/*
	 * 
	 * 	2020. 08. 25. 
	 * 
	 */
	
	/*
	 * 수강 신청 현황 디테일 페이지 이동
	 */
	@RequestMapping(value = "/classApply/detail", method = RequestMethod.GET)
	public String goClassapplyDetail(@RequestParam ("cano") int cano, Model model) {
		model.addAttribute("ca", classapplyService.getClassApply(cano));
		return "classapply/detail";
	}

	/*
	 * 수강 신청 현황 수정 하기
	 */
	@RequestMapping(value = "/classApply/update", method = RequestMethod.POST)
	public String classapplyUpdate(@ModelAttribute ClassDTO dto) {
		classapplyService.updateClassApply(dto);
		return "redirect:/classApply/list";
	}



}
