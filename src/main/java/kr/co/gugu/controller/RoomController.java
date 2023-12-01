package kr.co.gugu.controller;

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

import kr.co.gugu.domain.SearchPaging;
import kr.co.gugu.domain.PageMaker;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.ReplyDTO;
import kr.co.gugu.domain.RoomDTO;
import kr.co.gugu.service.RoomService;


@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	@Autowired
	RoomService roomService;
	RoomDTO roomDTO;

	// 목록 및 검색
	@RequestMapping(value = "/RoomList", method = RequestMethod.GET)

	public String RoomSearch(@ModelAttribute("searchPaging") SearchPaging searchPaging, Model model) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(roomService.CountPaging(searchPaging));

		model.addAttribute("list", roomService.Search(searchPaging));
		model.addAttribute("pageMaker", pageMaker);

		return "/room/RoomList";
	}

	// 강의실 등록
	@RequestMapping(value = "/AddRoom", method = RequestMethod.GET)
	public String AddRoom() throws Exception {
		return "/room/AddRoom";
	}

	// 강의실 등록
		@RequestMapping(value = "/AddRoom", method = RequestMethod.POST)
		public String AddRoom(RoomDTO rDTO, RedirectAttributes rttr, Model model) throws Exception {
			System.out.println("------------------------");
			System.out.println(rDTO.getPost()+" / "+rDTO.getRoadAddress());
			 String road=rDTO.getRoadAddress()+"("+rDTO.getPost()+")";
	       
	        rDTO.setAddress(road);
	        System.out.println(road);
	      
	      
			int i = roomService.AddRoom(rDTO);
			System.out.println("------------------------");
			if (i > 0) {
				rttr.addFlashAttribute("result", rDTO.getRoomno());
				System.out.println(i);
				
				
				return "redirect:/RoomList";

			} else {
				return "/room/AddRoom";
			}
		}
		

	// 페이징 처리
	@RequestMapping(value = "/RoomPaging", method = RequestMethod.GET)
	public String RoomPaging(Model model, Paging paging) throws Exception {
		model.addAttribute("paging", roomService.Paging(paging));
		return "/room/RoomList";
	}

	// 강의실 상세보기
	@RequestMapping(value = "/RoomDetail", method = RequestMethod.GET)
	public String RoomDetail(@RequestParam("roomno") int roomno, Model model) throws Exception {

		RoomDTO roomDTO = roomService.RoomDetail(roomno);
		model.addAttribute("list", roomDTO);
		
		return"/room/RoomDetail";
	}
	// 강의실 정보 삭제
		@RequestMapping(value = "/RoomDelete", method = RequestMethod.GET)
		public String RoomDelete(@RequestParam("roomno") int roomno, RedirectAttributes rttr) throws Exception {
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa==========================");
			int i = roomService.RoomDelete(roomno);
			if (i > 0) {
				System.out.println("삭제되었습니다");
			
				return "redirect:RoomList";
			}
			return "redirect:RoomDetail?roomno=" + roomno;
		}	

	// 강의실 수정
		@RequestMapping(value = "/RoomUpdate", method = RequestMethod.GET)
		public String RoomUpdate(@RequestParam("roomno") int roomno, Model model) throws Exception {
			RoomDTO roomDTO = roomService.RoomDetail(roomno);
			model.addAttribute("list", roomDTO);

			
			
			return "/room/RoomUpdate";

		}

		// 수정 POST 방식
				@ResponseBody
				@RequestMapping(value = "/RoomUpdate", method = RequestMethod.POST)
				public int RoomUpdate(@ModelAttribute RoomDTO room) throws Exception {
					System.out.println("==================="+room);
					
					System.out.println(
							"zzzzzzzzzzzzzzz"+room.getContent());
					System.out.println(room.getPost()+" / "+room.getRoadAddress());
			        String road=room.getRoadAddress()+"("+room.getPost()+")";
			      
			        room.setAddress(road);

			        System.out.println(road);
					
					
					
					return roomService.RoomUpdate(room);
				}

	
	

}
