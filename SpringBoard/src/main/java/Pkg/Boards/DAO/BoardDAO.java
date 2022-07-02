package Pkg.Boards.DAO;

import java.util.ArrayList;

import Pkg.Boards.VO.BoardVO;
import Pkg.Boards.VO.MemberVO;

public interface BoardDAO {

	public ArrayList<BoardVO> getBoardsList(String idx);
	public ArrayList<MemberVO> getMembersList(String userID);
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status);

	public void deleteBoard(String[] idx);

}
