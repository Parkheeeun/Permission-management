package Pkg.Admin.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/start")
	public String indexAuth() {
		
		return "/index";
	}
	
	@RequestMapping("/MissLogin") //로그인실패했을때
	public String MissLogin() {
		
		return "/index";
	}
	
	
	@RequestMapping("AdminLogin")
	public String login(String adminID, String adminPass,HttpSession session) {
		/*
		//로그인처리
		String id="ADMIN";
		String pass="1234";
		if(adminID.equals(id) && adminPass.equals(pass)) {
			session.setAttribute("adminID",adminID);
			
		}
		
		System.out.println(adminID);
		return "index";
		*/
		String dbID="ADMIN";
		String dbPass="1234";
		String page="";
		if(adminID.equals(dbID) && adminPass.equals(dbPass)) {
			session.setAttribute("adminID", adminID);
			page="redirect:AuthManager";
			
		}else {
			page="/index";
		}
		
		
		return page;
	}
	
	@RequestMapping("AdminLogout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션종료
		return "/index";
	}
	
	@RequestMapping("Login")
	public String goLogin() {
		
		return "login";
	}
}
