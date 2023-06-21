
  package com.baseball.common.interceptor;
  
  import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse; import
  javax.servlet.http.HttpSession;
  
  import org.springframework.stereotype.Component; import
  org.springframework.web.servlet.HandlerInterceptor; import
  org.springframework.web.servlet.ModelAndView;
  
  @Component public class LogonCheckInterceptor implements HandlerInterceptor {
  
  @Override public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
	  
	  HttpSession session = request.getSession();
  
  if (session.getAttribute("user") == null) { // 로그인되지 않은 경우
	  
	  String msg = "세션이 만료되었습니다. 다시 로그인 해 주세요.";
	  String url = "/user/login.jsp";
	  
	  try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	  return false;
	}
		  return true; // 로그인된 경우 요청 허용 
		  }

		  
  @Override public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception { // 요청 처리 이후에 추가적인 작업을 수행할 수 있습니다. 
	  
	  
  }
  
  @Override public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	  
	  
	  			
  	}
  
  }
  
 