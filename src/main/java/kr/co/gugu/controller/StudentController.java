package kr.co.gugu.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gugu.dao.StudentDAO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.PageMaker;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.service.StudentService;

@Controller
public class StudentController {

	@Inject
	StudentService studentService;
	StudentDAO studentDAO;

	// 원생등록 ------> http://localhost:8080/gugu/signup/form
	@RequestMapping(value = "/MemberAdd", method = RequestMethod.GET)
	public String MemberAdd() {
		return "member/signup";
	}

	// 원생검색
	@RequestMapping(value = "/MemberSearch", method = RequestMethod.GET)
	public String MemberSearch(Model model, @ModelAttribute("searchPaging") SearchPaging searchPaging)
			throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(studentService.CountSearch(searchPaging));

		model.addAttribute("MemberList", studentService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);

		return "/student/MemberSearch";
	}

	// 원생검색
	@RequestMapping(value = "/UserSearch", method = RequestMethod.GET)
	public String UserSearch(Model model, @ModelAttribute("searchPaging") SearchPaging searchPaging) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(studentService.UserCountSearch(searchPaging));

		model.addAttribute("PeopleList", studentService.UserSearch(searchPaging));
		model.addAttribute("pageMaker", pageMaker);
		return "/student/UserSearch";
	}
	
	// 페이징처리
	@RequestMapping(value = "/MemberPaging", method = RequestMethod.GET)
	public String MemberPaging(Model model, Paging paging) throws Exception {
		model.addAttribute("paging", studentService.Paging(paging));
		return "/student/MemberSearch";
	}

	// 관리자_원생정보수정
	@RequestMapping(value = "/MemberMypageUpdate", method = RequestMethod.GET)
	public ModelAndView MemberMypageUpdate(@RequestParam("mid") String mid) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", studentService.MemberSearchId(mid));
		mav.addObject("people", studentService.PeopleSearchId(mid));
		mav.setViewName("/student/MemberMypageUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/MemberMypageUpdate", method = RequestMethod.POST)
	public String MemberMypageUpdate(MemberDTO memberDTO) throws Exception {
		studentService.MemberMypageUpdate(memberDTO);
		return "redirect:MemberMypageUpdate?mid=" + memberDTO.getMid();
	}

	// 관리자_user정보수정
	@RequestMapping(value = "/UserMypageUpdate", method = RequestMethod.GET)
	public ModelAndView UserMypageUpdate(@RequestParam("mid") String mid, @RequestParam("pno") int pno,
			AttendanceDTO att) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("people", studentService.PeopleSearchId1(pno));
		mav.addObject("member", studentService.MemberSearchId(mid));
		mav.addObject("attend", studentService.AttendSearchId(pno));
		mav.setViewName("/student/UserMypageUpdate");
		return mav;
	}

	@RequestMapping(value = "/UserMypageUpdate", method = RequestMethod.POST)
	public String UserMypageUpdate(MemberDTO memberDTO) throws Exception {
		studentService.MemberMypageUpdate(memberDTO);
		return "redirect:UserMypageUpdate?mid=" + memberDTO.getMid();
	}

	
//	원생관리 - 개인정보수정
	@RequestMapping(value = "/PeopleMypageUpdate", method = RequestMethod.POST)
	public String PeopleMypageUpdate(PeopleDTO peopleDTO, @RequestParam("mid") String mid) throws Exception {
		studentService.PeopleMypageUpdate(peopleDTO);
		return "redirect:MemberMypageUpdate?mid=" + peopleDTO.getMid();
//		return "redirect:MypageInfoUpdate?mid=" + peopleDTO.getMid();

	}
	
	// 마이페이지정보수정
		@RequestMapping(value = "/MemberMypageUpdate2", method = RequestMethod.GET)
		public ModelAndView MemberMypageUpdate2(@RequestParam("mid") String mid) throws Exception {
			ModelAndView mav = new ModelAndView();
			mav.addObject("member", studentService.MemberSearchId(mid));
			mav.addObject("people", studentService.PeopleSearchId(mid));
			mav.setViewName("/student/MemberMypageUpdate2");
			return mav;
		}

		@RequestMapping(value = "/MemberMypageUpdate2", method = RequestMethod.POST)
		public String MemberMypageUpdate2(MemberDTO memberDTO, @RequestParam("mid") String mid, HttpSession session)
				throws Exception {
			String aa = (String) session.getAttribute("userID");
			studentService.MemberMypageUpdate(memberDTO);
			return "redirect:MypageInfoUpdate?mid=" + mid;
		}
		
		
		//마이페이지 - 개인정보수정		 
		@RequestMapping(value = "/PeopleMypageUpdate2", method = RequestMethod.POST)
		public String PeopleMypageUpdate2(PeopleDTO peopleDTO, HttpSession session) throws Exception {
			String mid = (String) session.getAttribute("userID");
			studentService.PeopleMypageUpdate(peopleDTO);
			return "redirect:MypageInfoUpdate?mid=" + mid;
		}
	
		
		
		
		
		
		@RequestMapping(value = "/MypageInfoUpdate", method = RequestMethod.GET)
		public ModelAndView MypageInfoUpdate(PeopleDTO peopleDTO, HttpSession session) throws Exception {
			String mid = (String) session.getAttribute("userID");
			ModelAndView mav = new ModelAndView();
			mav.addObject("member", studentService.MemberSearchId(mid));
			mav.addObject("people", studentService.PeopleSearchId(mid));
			mav.setViewName("/student/MypageInfoUpdate");
			return mav;
		}
//	@RequestMapping(value = "/MypageInfoUpdate", method = RequestMethod.POST)
//	public String MypageInfoUpdate(PeopleDTO peopleDTO) throws Exception {
//		int r = studentService.MypageInfoUpdate(peopleDTO);
//		if (r > 0) {
//			return "redirect:/";
//		}
//		return "/student/MypageInfoUpdate";
//	}

	// 원생추가
	@RequestMapping(value = "/PeopleAdd", method = RequestMethod.GET)
	public String PeopleAdd() throws Exception {
		return "/student/PeopleAdd";
	}
	

	@RequestMapping(value = "/PeopleAdd", method = RequestMethod.POST)
	public String PeopleAdd(PeopleDTO peopleDTO) throws Exception {
		studentService.PeopleAdd(peopleDTO);
		return "redirect:MypageInfoUpdate?mid="+peopleDTO.getMid();
	}
	
	
	//관리자용 원생추가
		@RequestMapping(value = "/mPeopleAdd", method = RequestMethod.GET)
		public String mPeopleAdd() throws Exception {
			return "/member/userjoinForm";
		}
		

		@RequestMapping(value = "/mPeopleAdd", method = RequestMethod.POST)
		public String mPeopleAdd(PeopleDTO peopleDTO) throws Exception {
			studentService.PeopleAdd(peopleDTO);
			return "redirect:/home";
		}

	
	
	// 원생추가
	@RequestMapping(value = "/StudentAdd", method = RequestMethod.GET)
	public String StudentAdd() throws Exception {
		return "/student/StudentAdd";
	}

	@RequestMapping(value = "/StudentAdd", method = RequestMethod.POST)
	public String StudentAdd(PeopleDTO peopleDTO) throws Exception {
		studentService.PeopleAdd(peopleDTO);
		return "redirect:MypageInfoUpdate?"+peopleDTO.getMid();
	}
	
//	// 원생삭제
//	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
//	public String MemberDelete(@RequestParam("mno") int mno) throws Exception {
//		int r = studentService.MemberDelete(mno);
//		if(r>0) {
//			return "redirect:MemberSearch";
//		}
//		return "/student/MemberDetail";
//	}
}
