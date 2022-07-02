package Pkg.Boards.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import Pkg.Boards.Service.BoardService;
import Pkg.Boards.VO.BoardVO;

//@Controller
public class BoardController2 {
	
	@Autowired
	BoardService boardService; //DI

	@RequestMapping("/helloSpring")
	public ModelAndView parkheeeun() {
		
	
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
	
	@RequestMapping("/aaaa.dddd")
	public ModelAndView getHello() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("data1","안녕하세요");
		mv.setViewName("index.jsp");
		
		return mv;
	}
	
	@RequestMapping("/boardList")
	public String getBoardList(String idx, String id, Model model) {
		
		ArrayList<BoardVO> boardList=boardService.getBoardList(idx);
		
		model.addAttribute("boardList",boardList);
		
		return "/Boards/list";
	}
	
	
	@RequestMapping("/writeForm")
	public String goWrite() {

		return "/Boards/write";
	}
	
	
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardVO vo, Model model) {
		//System.out.print(vo.getIdx());
		boardService.insertBoard(vo);
		
		ArrayList<BoardVO> boardList=boardService.getBoardList("");
		
		model.addAttribute("boardList",boardList);
		
		return "/Boards/list";
	}
	
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(String idx, Model model) {
		boardService.deleteBoard(idx);
		
		ArrayList<BoardVO> boardList=boardService.getBoardList("");
		
		model.addAttribute("boardList",boardList);
		
		return "/Boards/list";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(String idx, Model model) {
		ArrayList<BoardVO> boardList=boardService.getBoardList(idx);
		BoardVO boardVO=boardList.get(0);
		
		model.addAttribute("boardVO",boardVO);
		
		return "/Boards/update";
	}
	
	@RequestMapping("/updateBoard")
	public String updateBoard(BoardVO vo, Model model) {
		boardService.updateBoard(vo);
		
		
		ArrayList<BoardVO> boardList=boardService.getBoardList("");
		
		model.addAttribute("boardList",boardList);
		return "/Boards/list";
	}
	
	
	
	
}
