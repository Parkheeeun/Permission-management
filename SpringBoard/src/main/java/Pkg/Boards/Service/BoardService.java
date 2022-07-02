package Pkg.Boards.Service;

import java.util.ArrayList;

import Pkg.Boards.VO.BoardVO;

public interface BoardService {

	
	public ArrayList<BoardVO> getBoardList(String idx);
	
	public void insertBoard(BoardVO vo);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(String idx);
}
