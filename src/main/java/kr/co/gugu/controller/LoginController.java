package kr.co.gugu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.gugu.common.SnsLoginAPI;
import kr.co.gugu.domain.MemberDTO;
import kr.co.gugu.service.MemberService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/login/form", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("login - form");
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login/checkIdAndPassword", method = RequestMethod.POST)
	public boolean checkIdAndPassword(@RequestParam Map<String, String> map, HttpSession session) {
		logger.info("login - id and pw check");
		return (memberService.checkIdAndPassword(map, session) == 1);
	}
	
	@RequestMapping(value = "/login/action", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, HttpSession session) {
		logger.info("login - action");
		memberService.login(member, session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/signup/form", method = RequestMethod.GET)
	public String signupForm() {
		logger.info("signup - form");
		return "member/signup";
	}
	@RequestMapping(value = "/signup/mform", method = RequestMethod.GET)
	public String signupmForm() {
		logger.info("signup - form");
		return "member/memberjoinForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signup/duplicateCheck", method = RequestMethod.GET)
	public boolean duplicateCheckId(@RequestParam Map<String, String> map) {
		return (memberService.duplicateCheck(map) == 0);
	}
	
	
	@RequestMapping(value = "/signup/addMember", method = RequestMethod.POST)
	public String addMember(@ModelAttribute MemberDTO member) {
		logger.info("signup - addMember");
		memberService.signup(member);
		return "redirect:/login/form";
	}
	
	@RequestMapping(value = "/signup/maddMember", method = RequestMethod.POST)
	public String addmMember(@ModelAttribute MemberDTO member) {
		logger.info("signup - addMember");
		memberService.signup(member);
		return "redirect:/MemberSearch";
	}
	
	
	
	
	
	@RequestMapping(value = "/logout")
	public String addMember(HttpSession session) {
		logger.info("logout");
		memberService.logout(session);
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	// 비밀번호 찾기

		@RequestMapping(value = "/login/findpw", method = RequestMethod.GET)
		public String findpwForm() {
			logger.info("findpwForm");
			return "member/findpw";
		}

		@RequestMapping(value = "/login/findpw", method = RequestMethod.POST)
		public String findpw(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			logger.info("findpw");
			
			HttpSession session = req.getSession();

			MemberDTO findpw = memberService.findpw(dto);
			System.out.println(findpw);
			System.out.println(dto.getMid());
			System.out.println(dto.getMemail());

			if (findpw == null) {
			
				return "member/findpw";

			} else {
				
				session.setAttribute("dto", findpw);
				session.setAttribute("member", dto);
				return "member/resetPw";

			}
		}
		// 새 비밀번호
		@RequestMapping(value = "/login/resetPw", method = RequestMethod.GET)
		public String resetPwForm(@ModelAttribute MemberDTO member, HttpSession session) {
			logger.info("resetPwForm");
			return "member/resetPw";
		}
		

		@ResponseBody
		@RequestMapping(value = "/login/resetPw", method = RequestMethod.POST)
		public int resetPw(@ModelAttribute MemberDTO memberDTO, HttpSession session) throws Exception {
			logger.info("resetPw");
			
			System.out.println(memberDTO.getMpw());
			MemberDTO dto= (MemberDTO) session.getAttribute("member");
			dto.setMpw(memberDTO.getMpw());
			
			return memberService.resetPw(dto);

		}
		
		

	//아이디 찾기
		@RequestMapping(value = "/login/findId", method = RequestMethod.GET)
		public String findIdForm() {
			logger.info("findIdForm");
			return "member/findpw";
		}

		// 아이디 찾기
		@ResponseBody
		@RequestMapping (value="/login/findId", method=RequestMethod.POST)
		public String findId(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
			System.out.println("findId");
			// 서비스를 호출해서 로그인 확인
			MemberDTO dto = memberService.findId(memberDTO);
			model.addAttribute("dto", dto);
			
			if(dto.getMid()==null) {
				model.addAttribute("dto", dto);
				
				return "redirect:/login/findpw";
			}else {
				
				session.setAttribute("mid", dto.getMid());
				System.out.println(dto.getMid());
				return "redirect:login/findId2";
			}
			
		}
		@RequestMapping(value = "/login/findId2", method = RequestMethod.GET)
		public String findId2(HttpSession session, Model model) {
			
			model.addAttribute("mid", session.getAttribute("mid"));
			System.out.println(session.getAttribute("mid"));
			return "member/findIdForm";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Autowired
	SnsLoginAPI loginApi;
	
	@ResponseBody
	@RequestMapping(value="/login/getUrl")
	public Map<String, String> getUrl(@RequestParam Map<String, String> map) {
		return loginApi.getURL(map);
	}
	
	@RequestMapping(value="/login/forKakao")
	public String loginForKakao(@RequestParam("code") String code, HttpSession session) {
		String access_Token = loginApi.getAccessToken(code, "kakao");
        String id = loginApi.getUserInfo(access_Token, "kakao");
        

        memberService.loginForSNS(id, session);
        
        return "redirect: ../";
	}
	
	@RequestMapping(value="/login/forGoogle")
	public String loginForGoogle(@RequestParam("code") String code, HttpSession session) {
		String access_Token = loginApi.getAccessToken(code, "google");
		String id = loginApi.getUserInfo(access_Token, "google");
		
		memberService.loginForSNS(id, session);
		
		return "redirect: ../";
	}
	
	@RequestMapping(value="/login/forNaver")
	public String loginForNaver(@RequestParam("code") String code, HttpSession session) {
		String access_Token = loginApi.getAccessToken(code, "naver");
		String id = loginApi.getUserInfo(access_Token, "naver");
		
		memberService.loginForSNS(id, session);
		
		return "redirect: ../";
	}
	
}
