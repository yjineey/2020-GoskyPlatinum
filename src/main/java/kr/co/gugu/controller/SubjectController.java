package kr.co.gugu.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gugu.domain.ActDTO;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;
import kr.co.gugu.service.SubjectService;

@Controller
public class SubjectController {

	private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	
	@Autowired
	private SubjectService subjectService;
	
	/*
	 *  
	 *  	Activity
	 *  
	 */
	
	/*
	 *  		Activity 등록 페이지 이동
	 */
	@RequestMapping(value = "/act/regist", method = RequestMethod.GET)
	public ModelAndView actRegistPage(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		if(map.get("ssno") != null) {
			mav.addObject("act", subjectService.getAct(Integer.parseInt(map.get("ssno"))));
		}
		
		return mav;
	}
	
	/*
	 *  		Activity 등록
	 */
	@RequestMapping(value = "/act/regist", method = RequestMethod.POST)
	public ModelAndView actRegist(@ModelAttribute ActDTO actDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		subjectService.insertAct(actDTO);
		
		mav.setViewName("redirect:/act/list");
		return mav;
	}
	
	/*
	 *  		Activity 현황 리스트
	 */
	@RequestMapping(value = "/act/list", method = RequestMethod.GET)
	public ModelAndView actRegistPage() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	/*
	 *  		Activity 수정
	 */
	@RequestMapping(value = "/act/update", method = RequestMethod.POST)
	public ModelAndView actUpdate(@ModelAttribute ActDTO actDTO) {
		ModelAndView mav = new ModelAndView();
		
		subjectService.updateAct(actDTO);
		
		mav.setViewName("redirect:/act/list");
		return mav;
	}
	
	
	
	
	
	/*
	 *  		Act List
	 */	
	@ResponseBody
	@RequestMapping(value = "/act/getList", method = RequestMethod.GET)
	public List<ActDTO> getActList() {
		return subjectService.getActList();
	}
	
	/*
	 *  		Act Room List
	 */	
	@ResponseBody
	@RequestMapping(value = "/act/getRoomList", method = RequestMethod.GET)
	public List<RoomDTO> getActRoomList() throws Exception {
		return subjectService.getRoomList();
	}
	
	/*
	 * 			Get Act List for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/act/getListSearch", method = RequestMethod.GET)
	public List<ActDTO> getActListSearch(@ModelAttribute SearchPaging searchPaging) {
		return subjectService.getActListSearch(searchPaging);
	}
	
	/*
	 * 			Get Act List Page for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/act/getListPage", method = RequestMethod.GET)
	public PageMaker getActListPage(@ModelAttribute SearchPaging searchPaging) {
		return subjectService.getActListPage(searchPaging);
	}
	
	
	
	
	
	
	
	
	/*
	 * 
	 *  	Subject
	 *  
	 */
	
	/*
	 *  		Subject 등록 페이지 이동
	 */
	@RequestMapping(value = "/subject/regist", method = RequestMethod.GET)
	public ModelAndView subjectRegistPage(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		if(map.get("sno") != null) {
			mav.addObject("subject", subjectService.getSubject(Integer.parseInt(map.get("sno"))));
		}
		
		return mav;
	}
	
	/*
	 *  		Subject 등록 
	 */
	@RequestMapping(value = "/subject/regist", method = RequestMethod.POST)
	public ModelAndView subjectRegist(@ModelAttribute SubjectDTO subject) {
		ModelAndView mav = new ModelAndView();
		
		subjectService.insertSubject(subject);
		
		mav.setViewName("redirect:/subject/list");
		
		return mav;
	}
	
	/*
	 *  		Subject 현황 리스트 페이지
	 */
	@RequestMapping(value = "/subject/list", method = RequestMethod.GET)
	public ModelAndView subjectList() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 *  		Subject 수정
	 */
	@RequestMapping(value = "/subject/update", method = RequestMethod.POST)
	public ModelAndView subjectUpdate(@ModelAttribute SubjectDTO subject) {
		ModelAndView mav = new ModelAndView();
		System.out.println("sub내용" +subject.getSno());
		subjectService.updateSubject(subject);		
		mav.setViewName("redirect:/subject/list");
		
		return mav;
	}
	
	
	
	
	/*
	 *  		Subject 현황 리스트 페이지
	 */
	@ResponseBody
	@RequestMapping(value = "/subject/getTeacherList", method = RequestMethod.GET)
	public List<MemberDTO> getTeacherList(@RequestParam Map<String, String> map) {
		List<MemberDTO> list = subjectService.getTeacherListBySsort(Integer.parseInt(map.get("ssort")));
		return list;
	}
	
	/*
	 * 			Get Subject List for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/subject/getListSearch", method = RequestMethod.GET)
	public List<SubjectDTO> getSubjectListSearch(@ModelAttribute SearchPaging searchPaging) {
		return subjectService.getSubjectListSearch(searchPaging);
	}
	
	/*
	 * 			Get Subject List Page for Ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/subject/getListPage", method = RequestMethod.GET)
	public PageMaker getSubjectListPage(@ModelAttribute SearchPaging searchPaging) {
		return subjectService.getSubjectListPage(searchPaging);
	}
	
}
