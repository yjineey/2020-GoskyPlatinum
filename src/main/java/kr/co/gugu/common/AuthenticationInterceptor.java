package kr.co.gugu.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationInterceptor.class);

	
	// Controller 가 요청을 처리하기 전에 호출되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트에 부여한 세션을 가져온다.
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userID") == null) {
			// 로그인 상태가 아니라면 로그인으로 이동
			response.sendRedirect(request.getContextPath()+"/login/form");
			return false;
		}
		
		// 로그인 상태일시 그냥 통과 (컨트롤러 실행)
		return true;
	}

	// 예외가 발생하지 않은 경우에만 Controller 의 작업이 끝나면 호출되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		logger.info("=====================================================>  "+request.getRequestURI());			
		
	}

	// 예외 발생 여부에 상관없이 Controller의 작업이 끝나면 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		logger.info("=====================================================>  "+request.getRequestURI());	
		
	}

}
