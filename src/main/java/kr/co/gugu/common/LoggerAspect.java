package kr.co.gugu.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// advice : 공통 업무를 지원하는 클래스

@Component
@Aspect
public class LoggerAspect {
	protected Logger log = LoggerFactory.getLogger(LoggerAspect.class);
	
	// @before(해당 핵심 임무가 호출되기 전)
	@Around("execution(* kr.co.gugu.controller.*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object result = null;
		
		long start = System.currentTimeMillis();
		
		result = joinPoint.proceed();
		
		long end = System.currentTimeMillis();
		
		log.info("result time ====================> " +  timeConvert(end - start));
		
		return result;
	}
	
	public String timeConvert(long time) {
		
		String msec = "" + (time % 1000); time /= 1000;
		
		for(int i=msec.length(); i<3; i++)
			msec = "0" + msec;
		
		String sec = ((time % 60) / 10 == 0 ? "0" : "") + (time % 60) ; time /= 60;
		String min = ((time % 60) / 10 == 0 ? "0" : "") + (time % 60) ; time /= 60;
		String hr = "" + time;
		
		return " " + hr + ":" + min + ":" + sec + "." + msec;
	}
	
}
