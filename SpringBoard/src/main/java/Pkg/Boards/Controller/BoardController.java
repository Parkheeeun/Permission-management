package Pkg.Boards.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class BoardController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO 자동 생성된 메소드 스텁

		System.out.println("날불러줘");
		
		String data1="Hello WebSpring1";
		String data2="Hello WebSpring2";
		String jspPage="index.jsp";
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("data1", data1);
		mv.addObject("data2",data2);
		mv.setViewName(jspPage);
		
		return mv;
		
	}

}
