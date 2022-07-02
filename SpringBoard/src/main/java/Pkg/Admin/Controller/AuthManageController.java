package Pkg.Admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthManageController {

	@RequestMapping("index")
	public String goIndex() {
		
		return "/index";
	}
	
	
	
	@RequestMapping("AuthManager")
	public String goAuthManeger(Model model) {
		
		
		
		model.addAttribute("data", "testdata");
		System.out.println("AuthManager");
		return "/Admin/Auth_Manage";
	}
	
}
