package Pkg.Boards.DAO;


import java.util.List;
import java.util.Map;

import Pkg.Boards.VO.BoardVO;

public interface ListDAO {

	public List<BoardVO> getBoardList(String idx);
	
	public Map<String, Object> getProcBoardList(String idx);
	
	
}
