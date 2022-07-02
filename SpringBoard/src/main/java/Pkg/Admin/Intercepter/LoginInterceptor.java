package Pkg.Admin.Intercepter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		 System.out.println("preHandle2");
		 	
		 	HttpSession session=request.getSession();
		 	
		 	String adminID=(String)session.getAttribute("adminID");
		 	
		 	if(adminID==null) {
		 		response.sendRedirect("MissLogin");
		 		return false;
		 	}
		 
		 	
	       
	        return true;
		 	
	    }
	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        
	        System.out.println("postHandle2");
	        //자주사용하는값들을 여기에서 붙여줍니다.
	      
	        
	    }
	 
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	            throws Exception {
	        
	        System.out.println("afterCompletion2");
	       // System.out.println("--------------------------");
	        
	       HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	        
	    }
}
