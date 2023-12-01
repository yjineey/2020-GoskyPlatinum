package kr.co.gugu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gugu.service.IntroService;
import kr.co.gugu.service.SubjectService;

@Controller
public class IntroController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntroController.class);
	
	@Autowired
	private IntroService introService;
	
	//종목 리스트
	@RequestMapping(value = "/SIntroForm", method = RequestMethod.GET)
	public ModelAndView SIntroForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("=======================================");
		mav.addObject("list", introService.SIntroForm());
		
		System.out.println("===================="+ mav);
		mav.setViewName("/intro/SIntroForm");
		return mav;
	}
	
	
	//강사 리스트
		@RequestMapping(value = "/TIntroForm", method = RequestMethod.GET)
		public ModelAndView TIntroForm() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("mlist", introService.TIntroForm());
			mav.setViewName("/intro/TIntroForm");
			return mav;
		}
	//강사 약력 리스트
//		@RequestMapping(value = "/TIntroForm2", method = RequestMethod.GET)
//		public ModelAndView TIntroForm2() {
//			ModelAndView mav = new ModelAndView();
//			System.out.println("=======================================");
//			mav.addObject("tlist", introService.TIntroForm2());
//			
//			System.out.println("===================="+ mav);
//			mav.setViewName("/intro/TIntroForm");
//			return mav;
//		}

		//갤러리
		@RequestMapping(value = "/Greeting", method = RequestMethod.GET)
		public String Greeting() {
			return "intro/greeting";
		}
		//갤러리
		@RequestMapping(value = "/Gallery", method = RequestMethod.GET)
		public String Gallery() {
			return "intro/gallery";
		}
		//지도
		@RequestMapping(value = "/Map", method = RequestMethod.GET)
		public String Map() {
			return "intro/map";
		}
		
		 //유저 페이지///////////////////////////////////////////////
	      //과목 리스트
	      @RequestMapping(value = "/SIntroForm2", method = RequestMethod.GET)
	  	public ModelAndView SIntroForm2() {
	  		ModelAndView mav = new ModelAndView();
	  		System.out.println("=======================================");
	  		mav.addObject("list", introService.SIntroForm());
	  		
	  		System.out.println("===================="+ mav);
	  		mav.setViewName("/intro/SIntroForm2");
	  		return mav;
	  	}
	    //강사 리스트
			@RequestMapping(value = "/TIntroForm3", method = RequestMethod.GET)
			public ModelAndView TIntroForm3() {
				ModelAndView mav = new ModelAndView();
				mav.addObject("mlist", introService.TIntroForm());
				
				mav.setViewName("/intro/TIntroForm2");
				return mav;
			}
		//강사 약력 리스트
			@RequestMapping(value = "/TIntroForm4", method = RequestMethod.GET)
			public ModelAndView TIntroForm4() {
				ModelAndView mav = new ModelAndView();
				mav.addObject("mlist", introService.TIntroForm());
				
				mav.setViewName("/intro/TIntroForm2");
				return mav;
			}
			 //지도
		      @RequestMapping(value = "/userMap", method = RequestMethod.GET)
		      public String userMap() {
		         return "intro/userMap";
		      }
		    //갤러리
		      @RequestMapping(value = "/userGreeting", method = RequestMethod.GET)
		      public String userGreeting() {
		         return "intro/userGreeting";
		      }

		
}
