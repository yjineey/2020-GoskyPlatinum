package kr.co.gugu.controller;

import java.io.File;
import java.util.Calendar;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.dao.TeacherDAO;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.PageMaker;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.domain.TeacherDTO;
import kr.co.gugu.service.AttendanceService;
import kr.co.gugu.service.TeacherService;
import kr.co.gugu.util.UploadFile;

@Controller
public class TeacherController {

	private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);

	@Inject
	TeacherService teacherService;
	@Inject
	TeacherDAO teacherDAO;
	@Inject
	AttendanceService attendanceService;

	// 강사추가
	@RequestMapping(value = "/TeacherAdd", method = RequestMethod.GET)
	public String TeacherAdd() {
		return "teacher/TeacherAdd";
	}

	@RequestMapping(value = "/TeacherAdd", method = RequestMethod.POST)
	public String TeacherAdd(@ModelAttribute MemberDTO member) {
		teacherService.TeacherAdd(member);
		return "member/login";
	}

	// 강사업무_내정보 검색
	@RequestMapping(value = "/TeacherSearch", method = RequestMethod.GET)
	public String TeacherSearch(Model model, HttpSession session,
			@ModelAttribute("searchPaging") SearchPaging searchPaging) throws Exception {
		PageMaker pageMaker = new PageMaker();

		pageMaker.setPaging(searchPaging);

		pageMaker.setTotalCount(teacherService.CountSearch(searchPaging));
		model.addAttribute("TeacherList", teacherService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);

		return "/teacher/TeacherSearch";
	}

	// 강사신청리스트
	@RequestMapping(value = "/TeacherRequestSearch", method = RequestMethod.GET)
	public String TeacherRequestSearch(Model model, HttpSession session,
			@ModelAttribute("searchPaging") SearchPaging searchPaging) throws Exception {
		PageMaker pageMaker = new PageMaker();

		pageMaker.setPaging(searchPaging);

		pageMaker.setTotalCount(teacherService.CountRequestSearch(searchPaging));
		model.addAttribute("TeacherList", teacherService.RequestSearch(searchPaging));
		model.addAttribute("pageMaker", pageMaker);

		return "/teacher/TeacherRequestSearch";
	}

	// 강사업무_내 정보 수정
	@RequestMapping(value = "/TeacherDetail", method = RequestMethod.GET)
	public ModelAndView TeacherDetail(@RequestParam("mid") String mid) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.addObject("member", teacherService.TeacherMember(mid));
		mav.addObject("teacher", teacherService.TeacherTeacher(mid));
		mav.addObject("subject", teacherService.TeacherSubject(mid));
		mav.setViewName("/teacher/TeacherDetail");
		return mav;
	}



	@Resource(name = "uploadPath")
	private String uploadPath;

	// 강사업무_강사소개 추가
	@RequestMapping(value = "/TeacherInfoAdd", method = RequestMethod.POST)
	public String TeacherInfoAdd(@ModelAttribute TeacherDTO teacher, @RequestParam(value = "file", required = false) MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFile.calcPath(imgUploadPath);
		String fileName = null;

		if (!file.getOriginalFilename().equals("")) {
			fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		teacher.setImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		int r = teacherService.TeacherInfoAdd(teacher);

		return "redirect:/TeacherInfoUpdate";
	}

	// 강사업무_강사정보 업데이트
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)
	public String MemberUpdate(MemberDTO member) throws Exception {
		teacherService.MemberUpdate(member);
		return "redirect:TeacherInfoUpdate?mid="+member.getMid();
	}

	// 강사업무_강사요청자 정보 업데이트
	@RequestMapping(value = "/MemberUpdate2", method = RequestMethod.POST)
	public String MemberUpdate2(MemberDTO member, @RequestParam("mid") String mid) throws Exception {
			teacherService.MemberUpdate2(member);
			return "redirect:TeacherDetail?mid="+member.getMid();
	}

	// 강사업무_강사소개 업데이트
	@RequestMapping(value = "/TeacherUpdate", method = RequestMethod.POST)
	public String TeacherUpdate(@ModelAttribute TeacherDTO teacher, @RequestParam(value = "file", required = false) MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFile.calcPath(imgUploadPath);
		String fileName = null;

		if (!file.getOriginalFilename().equals("")) {
			fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			teacher.setImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} 

		int r = teacherService.TeacherUpdate(teacher);

		return "redirect:/TeacherInfoUpdate";
	}

	// 강사업무_과목업데이트
	@RequestMapping(value = "/SubjectUpdate", method = RequestMethod.POST)
	public String SubjectUpdate(SubjectDTO subjectDTO) throws Exception {
		int r = teacherService.SubjectUpdate(subjectDTO);
		if (r > 0) {
			return "redirect:TeacherDetail?mid="+subjectDTO.getMid();
		}
		return "/teacher/TeacherDetail";
	}


	// 페이징처리
	@RequestMapping(value = "/TeacherPaging", method = RequestMethod.GET)
	public String TeacherPaging(Model model, Paging paging) throws Exception {
		model.addAttribute("paging", teacherService.Paging(paging));
		return "/teacher/TeacherSearch";
	}

	// 강사업무_과목추가
	@RequestMapping(value = "/SubjectAdd", method = RequestMethod.GET)
	public String SubjectAdd() {
		return "teacher/SubjectAdd";
	}

	@RequestMapping(value = "/SubjectAdd", method = RequestMethod.POST)
	public String SubjectAdd(@ModelAttribute SubjectDTO subjectDTO) {
		teacherService.SubjectAdd(subjectDTO);
		return "redirect:TeacherSearch";
	}

	@RequestMapping(value="/classList", method = RequestMethod.GET)
	public String classList(@RequestParam("sno")int sno,
			HttpSession session,@RequestParam("status")int status, Model model) {
		//sno와 오늘날짜로 att에 검색

		AttendanceDTO a=new AttendanceDTO();
		String date=date();
		a.setBefor(sno);
		a.setAfter(sno);
		a.setDate(date);

		session.setAttribute("sno",sno);
		model.addAttribute("alist",attendanceService.getAttList(a));
		model.addAttribute("date",date);
		model.addAttribute("status",status);
		return "teacher/list";

	}

	//강사메뉴
	//회원출석 수정 
	@RequestMapping(value="/attUpdate", method = RequestMethod.GET)
	public String TeacherInfoUpdate(Model model,@RequestParam("ano")int ano,@RequestParam("status")int status
			) throws Exception {
		System.out.println("찾음");
		model.addAttribute("att",attendanceService.getAttendanceAno(ano));
		model.addAttribute("status",status);
		return "teacher/attUpdate";
	}

	//강사메뉴
	//회원출석 수정완료
	@RequestMapping(value = "/attUpdate", method = RequestMethod.POST)
	public ModelAndView TeacherInfoUpdate(HttpSession session,AttendanceDTO a,
			RedirectAttributes rttr,@RequestParam("status")int status
			) throws Exception {
		System.out.println(a.getAftercon()+a.getBeforcon());
		ModelAndView mav = new ModelAndView();
		if(status ==0) {
			attendanceService.setAttbeforcon(a);
		}
		else if(status == 1){
			attendanceService.setAttaftercon(a);
		}
		// mav.addObject("att",attendanceService.getAttendanceAno(a));

		rttr.addFlashAttribute("result");
		mav.setViewName("redirect:classList?sno="+session.getAttribute("sno")+"&status="+status);
		session.removeAttribute("sno");
		return mav;
	}


	//날짜계산 후 String형식으로 값주기
	public String date() {
		// 날짜입력
		int y = Calendar.getInstance().get(Calendar.YEAR);
		int m = Calendar.getInstance().get(Calendar.MONTH) + 1;
		int d = Calendar.getInstance().get(Calendar.DATE);
		String date = Integer.toString(y * 10000 + m * 100 + d);
		System.out.println(date);

		return date;

	}

}
