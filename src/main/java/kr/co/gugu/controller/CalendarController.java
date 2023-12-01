package kr.co.gugu.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gugu.common.DateData;
import kr.co.gugu.dao.AttendanceDAO;
import kr.co.gugu.domain.AttendanceDTO;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	@ResponseBody
	@RequestMapping(value = "/calendar/getYM", method = RequestMethod.GET)
	public DateData getYM(@ModelAttribute DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		
		if(dateData.getYear().length()==0 && dateData.getMonth().length()==0 ) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),
									String.valueOf(cal.get(Calendar.MONTH) + 1), 
									null, null);
		} else {
			if(Integer.parseInt(dateData.getMonth()) <= 0) {
				dateData.setYear(String.valueOf(Integer.parseInt(dateData.getYear()) - 1));
				dateData.setMonth("12");
			} else if( Integer.parseInt(dateData.getMonth()) > 12 ) {
				dateData.setYear(String.valueOf(Integer.parseInt(dateData.getYear()) + 1));
				dateData.setMonth("1");
			}
		}
		
		return dateData;
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendar/getDate", method = RequestMethod.GET)
	public DateData getDate(@ModelAttribute DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		
		if(dateData.getYear().length()==0 && dateData.getMonth().length()==0 && dateData.getDate().length()==0 ) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),
					String.valueOf(cal.get(Calendar.MONTH) + 1), 
					String.valueOf(cal.get(Calendar.DATE)), null);
		} else {
			dateData = setDateData(dateData);
		}
		
		return dateData;
	}
	
	public DateData setDateData(DateData d) {
		Calendar cal = Calendar.getInstance();
		
		int year  = Integer.parseInt(d.getYear());
		int month = Integer.parseInt(d.getMonth());
		int date  = Integer.parseInt(d.getDate());
		
		switch (Integer.parseInt(d.getValue())) {
		case 1:
			if(--month <= 0) { year--; month=12; }
			cal.set(year, month-1, 1);
			if(date > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) 
				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			break;
			
		case 2:
			if(--date <= 0) { 
				if(--month <= 0) { year--; month=12; }
				cal.set(year, month-1, 1);
				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			}
			break;
			
		case 3:
			cal.set(year, month-1, 1);
			if(++date > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) { 
				if(++month > 12) { year++; month=1; }
				date = 1;
			}
			break;
			
		case 4:
			if(++month > 12) { year++; month=1;	}
			cal.set(year, month-1, 1);
			if(date > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) 
				date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			break;

		default:
			break;
		}
		
		d = new DateData(year+"", month+"", date+"", null);
		
		return d;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendar/getAttendance", method = RequestMethod.GET)
	public List<DateData> getAttendance(@ModelAttribute DateData dateData,
								  @RequestParam ("key") String key,
								  @RequestParam ("num") int num ) {
		

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			dateList.add(new DateData(null, null, null, null));
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				dateList.add(new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today"));
			}else{
				dateList.add(new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date"));
			}
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				dateList.add(new DateData(null, null, null, null));
			}
		}
		
		if(num > 0) {
			
			List<AttendanceDTO> list = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int y = Integer.parseInt(dateData.getYear());
			int m = Integer.parseInt(dateData.getMonth());
			
			map.put("date", String.valueOf(y*100 + m));
			map.put("number", num);
			map.put("asort", key);
			
			list = attendanceDAO.getAttendanceListByNumber(map);
			
			int idx = 0;
			for(int i=0; i<list.size(); i++) {
				
				System.out.println("idx = "+idx+", i = "+i+", date :" + dateList.get(idx).getDate());
				
				if((dateList.get(idx).getDate().length() == 1 && dateList.get(idx).getDate().equals( list.get(i).getDate().substring(7))
						|| dateList.get(idx).getDate().equals( list.get(i).getDate().substring(6) )) ) {
					dateList.get(idx).setAttDTO(list.get(i));
				} else {
					i--;
				}
				
				idx++;
				
			}
			
		}
		
		return dateList;
	}
	
	
}
