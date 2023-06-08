/*
 * package com.baseball.common.interceptor;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.springframework.stereotype.Component; import
 * org.springframework.web.servlet.HandlerInterceptor; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * @Component public class LogonCheckInterceptor implements HandlerInterceptor {
 * 
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception { HttpSession
 * session = request.getSession();
 * 
 * if (session.getAttribute("user") == null) { 로그인되지 않은 경우
 * response.sendRedirect("/user/index.jsp"); // 로그인 페이지로 리다이렉트
 * System.out.println("Hello, World!"); return false; // 요청 중단 }
 * 
 * return true; // 로그인된 경우 요청 허용 }
 * 
 * @Override public void postHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
 * throws Exception { // 요청 처리 이후에 추가적인 작업을 수행할 수 있습니다. }
 * 
 * @Override public void afterCompletion(HttpServletRequest request,
 * HttpServletResponse response, Object handler, Exception ex) throws Exception
 * { // 요청 처리 완료 후에 추가적인 작업을 수행할 수 있습니다. } }
 */