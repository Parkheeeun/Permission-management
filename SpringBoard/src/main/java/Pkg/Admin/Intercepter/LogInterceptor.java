package Pkg.Admin.Intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LogInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
        //DispatcherServler이 호출되고 Controller가 호출되기직전에 호출된다.
        //System.out.println("preHandle");
        
        //1. login관리
        //2. page logger관리
        
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        //Controller가 동작하고 viewpage(jsp)로 전달되기 직전에 호출
        //System.out.println("postHandle");
        
        //String jspPageName=modelAndView.getViewName();
        //System.out.println(jspPageName);
        
        //1.공용으로 사용되는 데이터를 여기서붙인다.
        
        
        
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)throws Exception {
        //웹서버가 viewpage(jsp)랜더링을 끝내고 클라이언트에게 응답하기직전에 동작
        //System.out.println("afterCompletion");
        //System.out.println("--------------------------");
        
    }
}
