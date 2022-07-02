package Pkg.Admin.Test;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("test")
	public String testFunc(@RequestBody TestVO vo) {
		
		System.out.println(vo.getName());
		
		/*
		for(TestVO vos:vo) {
			System.out.println(vos.getName());
		}
		*/
		
		return "abc";
	}
}
