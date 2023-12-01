package kr.co.gugu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import kr.co.gugu.common.DateData;
import kr.co.gugu.common.LoggerAspect;
import kr.co.gugu.domain.AttendanceDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.domain.PeopleDTO;
import kr.co.gugu.page.SearchPaging;
import kr.co.gugu.domain.SubjectDTO;
import kr.co.gugu.service.AttendanceService;
import kr.co.gugu.service.ClassapplyService;

@Controller
public class AttendanceController {
   @Inject
   AttendanceService attService;
   @Inject
   ClassapplyService classService;
   protected Logger log = LoggerFactory.getLogger(LoggerAspect.class);

//People메뉴////////////////////////////////////////
   //출석하기 버튼
   @RequestMapping(value="/attendForm", method=RequestMethod.GET)
   public String appendForm() {
      return "attendance/attendForm";
   }
   
 //이름 생년원일로 로그인
   @RequestMapping(value="/attendForm", method=RequestMethod.POST)
   public String appendForm(PeopleDTO people
         ,Model model
         ,HttpSession session) {
     
      //people 이름이랑 생년원일로 있나확인 
	   people =attService.getPeople(people);
	  
      //빈값이면 페이지 돌려보냄
      if(people ==null ) {
         String b="비밀번호가 틀렸습니다";
         model.addAttribute("message",b);
         return "attendance/attendForm";
      }
      //진행중인 과목정보 보내주기
      else {
    	  AttendanceDTO a=new AttendanceDTO();
    	  //날짜입력
    	  String date= date();
    	  a.setDate(date);
          a.setNumber(people.getPno());
          a.setAsort(2);
          //출석상태(att) 1로 바꿔주기
          
    	 attService.att(a);
    	 
         List<SubjectDTO> sub1= new ArrayList<SubjectDTO>();
         List<SubjectDTO> sub2= new ArrayList<SubjectDTO>();
       
         for(SubjectDTO str:attService.getSubjectList()) {
            if(str.getStime() == 0) 
               sub1.add(str);
            else 
               sub2.add(str);
         }
         session.setAttribute("pno",people.getPno());
         model.addAttribute("sub1",sub1);
         model.addAttribute("sub2",sub2);
         return "attendance/selectSub";
      }
   }
   
   //과목 정해주기 befor,after넣어줘야돼  where date랑 pno=>number랑줘야돼
      @RequestMapping(value="/selectsub", method=RequestMethod.POST)
      public String selectsub(Model model,HttpSession session, AttendanceDTO a) {
    	//세션값 넣기
    	  a.setNumber((Integer) session.getAttribute("pno"));
        //날짜입력
            String date= date();
         a.setDate(date);
         //befor,after 수정해주기
            attService.saveSubject(a);
            session.invalidate();
            return "/";
         
      }
      
      
///////////////////////////////////////////////////////////////////      
//member(보호자)메뉴 수업확인
     //내 담당리스트 보내야돼
      @RequestMapping(value="/viewAttend", method=RequestMethod.GET)
      public String viewAttend(HttpSession session, Model model) {
    	  //관리자일 경우
    	  String msort =(String)session.getAttribute("msort");
    	  
    	  System.out.println(msort);
    	  
    	  
    	  
    	  if(msort.equals("m03")) {
    		  System.out.println("관리자");
    		  model.addAttribute("plist",classService.searchPeople());
    		  
    	  }
    	  else {
    	  //일반회원일 경우
    		  System.out.println("일반회원");
    		  model.addAttribute("plist", classService.searchpeople((String) session.getAttribute("userID")));
    	  }
    	  
    	  return "attendance/viewAttend";
      }
     
      
      
      //아작스로 리스트중 한명 기본값으로 정하고 date랑 bofor after가져와야함
      @ResponseBody
      @RequestMapping(value="/searchAttend", method=RequestMethod.GET)
      public List<AttendanceDTO> searchAttend(AttendanceDTO a) {
    	  List<AttendanceDTO> alist= attService.getAttendance(a);
    	  
    	  return alist;
      }
      
      
   //아작스로 불러온 값들 중 선택시 디테일
      @RequestMapping(value="/attendDetail", method=RequestMethod.GET)
   public String viewDetail(@RequestParam("ano")int ano,
		   Model model) {
    	  
    	  model.addAttribute("att",attService.getAttendanceAno(ano));
    	  return "attendance/attDetail";
      }
   
      
      
//////////////////////////////////////////////////      
    //강사메뉴
  	@RequestMapping(value = "/attendTeacher", method = RequestMethod.GET)
  	public String attnedTeacher2(@RequestParam(value = "date", required = false, defaultValue = "1") String date,
  			HttpSession session, Model model) {
  		AttendanceDTO att = new AttendanceDTO();

  		int i = (Integer) session.getAttribute("mno2");
  		if (date.equals("1")) {

  			date = date();
  			att.setAsort(1);
  			att.setDate(date);
  			att.setNumber(i);
  			System.out.println(date);
  			System.out.println("끝");
  			System.out.println(time());

  			date = date.substring(0, 4) + ". " + date.substring(4, 6) + ". " + date.substring(6);
  			AttendanceDTO att2 = attService.getAttendancemno(att);
  			model.addAttribute("att", att2);
  			model.addAttribute("date", date);
  			String tdate = date();
  		
  			
  			// att값이 없을경우 ->0
  			if (att2 == null) {
  				model.addAttribute("tdate", 0);
  			} else {
  				System.out.println(att2.getDate() + "   " + att2.getAtt());
  				System.out.println(tdate);
  				int aa = Integer.parseInt(att2.getDate());
  				int bb = Integer.parseInt(tdate);
  				
  				if (aa > bb && aa<bb) {
  					model.addAttribute("tdate", 1);
  				} else {
  					if (att2.getAtt() == 3) {

  						model.addAttribute("tdate", 2);
  					} else if (att2.getAtt()!=3 && att2.getDate().equals(tdate)){
  						model.addAttribute("tdate", 3);
  					}else {
  						model.addAttribute("tdate",0);
  					}
  				}
  			}
  		}
  			return "attendance/attendTeacher";

  		}
      
 // 날짜바꿔서 보기
 	@RequestMapping(value = "/attendTeacherdate", method = RequestMethod.GET)
 	public String attnedTeacherdate(@ModelAttribute DateData dateData, HttpSession session, Model model) {
 		AttendanceDTO att = new AttendanceDTO();
 		String date = setDateData2(dateData);
 		System.out.println("---------" + date);
 		int i = (Integer) session.getAttribute("mno2");
 		att.setNumber(i);
 		att.setAsort(1);
 		// date값이 없을경우 현재시간 넣어주기

 		att.setDate(date);
 		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
 		System.out.println(date);

 		date = date.substring(0, 4) + ". " + date.substring(4, 6) + ". " + date.substring(6);
 		AttendanceDTO att2 = attService.getAttendancemno(att);
 		model.addAttribute("att", att2);
 		model.addAttribute("date", date);
 		String tdate = date();
 		if (att2 == null) {
 			model.addAttribute("tdate", 0);
 		} else {
 			int aa = Integer.parseInt(att2.getDate());
 			int bb = Integer.parseInt(tdate);
 			System.out.println("============="+aa);
 			System.out.println(bb);
 			// att값이 없을경우 ->0
 			if (aa!=bb) {
 				model.addAttribute("tdate", 1);
 			} else {
 				if (att2.getAtt() == 3) {

 					model.addAttribute("tdate", 2);
 				} else if (att2.getAtt()!=3 && att2.getDate().equals(tdate)){
 					model.addAttribute("tdate", 3);
 				}else {
 					model.addAttribute("tdate",0);
 				}
 			}
 		}

 		return "attendance/attendTeacher";
	}
      
      //본인출결하기 버튼클릭
      @RequestMapping(value="/checkAttend", method=RequestMethod.GET)
      public String checkAttend (@RequestParam("ano") int ano,Model model) {
    	  model.addAttribute("time",time());
    	  model.addAttribute("ano",ano);
    	  System.out.println("시간 "+time());
    	  
    	  return "attendance/checkAttend";
      }
      
   
      //출결저장
      @RequestMapping(value="/checkAttend", method=RequestMethod.POST)
      public String checkAttendsave(AttendanceDTO attendDTO,Model model) {
    	  //받은 값 그대로 넣어주기 
    	  attService.attTeacher(attendDTO);
    	  
    	  //보내는건 다시 teacher로
    	  return "redirect:attendTeacher";
      }
      
      
      
      
      
////////////////////////////////////////
//관리자메뉴
      //첫화면 오늘날짜 모든 출석부 보이기
      @RequestMapping(value="/attendance/list", method=RequestMethod.GET)
      public String goAttendanceList() {
    	  return "attendance/admin/list";
      }
      
      // 강사 / 원생 - 출결 리스트 추가
      @ResponseBody
      @RequestMapping(value="/attendance/insertAtt", method=RequestMethod.GET)
      public boolean insertAtt(@ModelAttribute DateData d) {
    	  //오늘 날자값만 줌
    	  // 강사리스트 불러와서 각번호 불러옴
    	  
    	  System.out.println(d);
    	  
    	  if(!isToday(d))
    		  return false; 
    	  
    	  AttendanceDTO a =new AttendanceDTO();
    	  a.setDate(date());
    	  
    	  //att테이블에 값넣기
    	  if(d.getValue().equals("p"))
    		  return attService.insertPeople(a) > 0 ;
    	  else
    		  return attService.insertTeacher(a) > 0;
      }
    
      public boolean isToday(DateData d) {
    	  Calendar cal = Calendar.getInstance();
    	  
    	  return cal.get(Calendar.YEAR) == Integer.parseInt(d.getYear())
    			 && cal.get(Calendar.MONTH) + 1 == Integer.parseInt(d.getMonth())
    	  		 && cal.get(Calendar.DATE) == Integer.parseInt(d.getDate());
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
      
      public String time() {
    	  SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
    	  
    	  Calendar time = Calendar.getInstance();
    	         
    	  String format_time1 = format1.format(time.getTime());
    	      
    	  System.out.println(format_time1);
    	 
    	  return format_time1;
      }
   
      @RequestMapping(value = "/calendar/attendTeacher", method = RequestMethod.GET)
  	public String attendTeacher(@ModelAttribute DateData dateData, Model model) {

  		Calendar cal = Calendar.getInstance();

  		if (dateData.getYear().length() == 0 && dateData.getMonth().length() == 0 && dateData.getDate().length() == 0) {
  			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH) + 1),
  					String.valueOf(cal.get(Calendar.DATE)), null);
  		} else {
  			dateData = setDateData(dateData);
  			System.out.println(dateData);
  		}
  		model.addAttribute("datelist", attService);
  		return "attendance/attendTeacher";
  	}

  	public String setDateData2(DateData d) {
  		Calendar cal = Calendar.getInstance();

  		int year = Integer.parseInt(d.getYear());
  		int month = Integer.parseInt(d.getMonth());
  		int date = Integer.parseInt(d.getDate());

  		switch (Integer.parseInt(d.getValue())) {
  		case 1:
  			if (--month <= 0) {
  				year--;
  				month = 12;
  			}
  			cal.set(year, month - 1, 1);
  			if (date > cal.getActualMaximum(Calendar.DAY_OF_MONTH))
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			break;

  		case 2:
  			if (--date <= 0) {
  				if (--month <= 0) {
  					year--;
  					month = 12;
  				}
  				cal.set(year, month - 1, 1);
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			}
  			break;

  		case 3:
  			cal.set(year, month - 1, 1);
  			if (++date > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
  				if (++month > 12) {
  					year++;
  					month = 1;
  				}
  				date = 1;
  			}
  			break;

  		case 4:
  			if (++month > 12) {
  				year++;
  				month = 1;
  			}
  			cal.set(year, month - 1, 1);
  			if (date > cal.getActualMaximum(Calendar.DAY_OF_MONTH))
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			break;

  		default:
  			break;
  		}

  		d = new DateData(year + "", month + "", date + "", null);
  		String date2 = Integer.toString(year * 10000 + month * 100 + date);
  		System.out.println(d);
  		return date2;

  	}

  	public DateData setDateData(DateData d) {
  		Calendar cal = Calendar.getInstance();

  		int year = Integer.parseInt(d.getYear());
  		int month = Integer.parseInt(d.getMonth());
  		int date = Integer.parseInt(d.getDate());

  		switch (Integer.parseInt(d.getValue())) {
  		case 1:
  			if (--month <= 0) {
  				year--;
  				month = 12;
  			}
  			cal.set(year, month - 1, 1);
  			if (date > cal.getActualMaximum(Calendar.DAY_OF_MONTH))
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			break;

  		case 2:
  			if (--date <= 0) {
  				if (--month <= 0) {
  					year--;
  					month = 12;
  				}
  				cal.set(year, month - 1, 1);
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			}
  			break;

  		case 3:
  			cal.set(year, month - 1, 1);
  			if (++date > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
  				if (++month > 12) {
  					year++;
  					month = 1;
  				}
  				date = 1;
  			}
  			break;

  		case 4:
  			if (++month > 12) {
  				year++;
  				month = 1;
  			}
  			cal.set(year, month - 1, 1);
  			if (date > cal.getActualMaximum(Calendar.DAY_OF_MONTH))
  				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  			break;

  		default:
  			break;
  		}

  		d = new DateData(year + "", month + "", date + "", null);

  		return d;

  	}
      
      
      /*
       * 
       * 		2020. 08. 22
       * 
       */
      
  	/*
  	 * 			Get attendance List for Ajax
  	 */
  	@ResponseBody
  	@RequestMapping(value = "/attendance/getListSearch", method = RequestMethod.GET)
  	public List<AttendanceDTO> getAttendanceListSearch(@ModelAttribute SearchPaging searchPaging) {
  		return attService.getAttendanceListSearch(searchPaging);
  	}
  	
  	/*
  	 * 			Get attendance List Paging for Ajax
  	 */
  	@ResponseBody
  	@RequestMapping(value = "/attendance/getListPage", method = RequestMethod.GET)
  	public PageMaker getAttendanceListPage(@ModelAttribute SearchPaging searchPaging) {
  		return attService.countAttendanceListSearch(searchPaging);
  	}
}