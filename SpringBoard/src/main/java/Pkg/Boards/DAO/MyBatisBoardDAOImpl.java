package Pkg.Boards.DAO;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import Pkg.Boards.VO.BoardVO;
import Pkg.Boards.VO.MemberVO;

public class MyBatisBoardDAOImpl implements BoardDAO {

	@Override
	public ArrayList<BoardVO> getBoardsList(String idx) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}

	@Override
	public ArrayList<MemberVO> getMembersList(String userID) {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}

	@Override
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status) {
		// TODO 자동 생성된 메소드 스텁
		
	}

	@Override
	public void deleteBoard(String[] idx) {
		// TODO 자동 생성된 메소드 스텁
		
	}

}
