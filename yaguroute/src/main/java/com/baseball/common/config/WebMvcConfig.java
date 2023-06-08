/*
 * package com.baseball.common.config;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.web.servlet.config.annotation.InterceptorRegistry; import
 * org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 * 
 * import com.baseball.common.interceptor.LogonCheckInterceptor;
 * 
 * @Configuration public class WebMvcConfig implements WebMvcConfigurer {
 * 
 * private final LogonCheckInterceptor logonCheckInterceptor;
 * 
 * @Autowired public WebMvcConfig(LogonCheckInterceptor logonCheckInterceptor) {
 * System.out.println("Hello, World!"); this.logonCheckInterceptor =
 * logonCheckInterceptor; }
 * 
 * @Override public void addInterceptors(InterceptorRegistry registry) { //
 * 인터셉터를 등록합니다. registry.addInterceptor(logonCheckInterceptor)
 * 
 * .addPathPatterns("/**") // 인터셉터를 적용할 URL 패턴을 지정합니다.
 * .excludePathPatterns("/user/loginTest(new).jsp",
 * "/users/login","/user/index.jsp", "/main.jsp",
 * "/user/addKakaoUser.jsp","/user/addNaverUser.jsp") // 인터셉터를 적용하지 않을 URL 패턴을
 * 지정할 수도 있습니다. .excludePathPatterns("/js/**", "/css/**", "/images/**"); // 정적
 * 파일 경로 패턴 추가 } }
 */