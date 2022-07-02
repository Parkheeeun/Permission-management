package Pkg.Boards.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pkg.Boards.Service.BoardsService;
import Pkg.Boards.VO.BoardVO;
import Pkg.Boards.VO.MemberVO;

@Controller
public class BoardsController {
	
	@Autowired
	private BoardsService boardsService;
	
	@RequestMapping("boardsList")
	public String goBoards(Model model) {
		//1.data가져오기
		ArrayList<BoardVO> boardList=boardsService.getBoardList("");
		ArrayList<MemberVO> memberList=boardsService.getMemberList("");
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		return "/Boards/boards";
	}
	
	@RequestMapping("saveBoard")
	public String saveBoard(String[] idx, String[] title, String[] userID, String[] status, Model model) {
		boardsService.saveBoard(idx, title, userID, status);
			ArrayList<BoardVO> boardList=boardsService.getBoardList("");
			ArrayList<MemberVO> memberList=boardsService.getMemberList("");
				
			model.addAttribute("boardList",boardList);
			model.addAttribute("memberList",memberList);
		return "/Boards/boards";
	}
	
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(String[] idx,Model model) {
		boardsService.deleteBoard(idx);
		ArrayList<BoardVO> boardList=boardsService.getBoardList("");
		ArrayList<MemberVO> memberList=boardsService.getMemberList("");
			
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		return "/Boards/boards";
	}
	
	
}
