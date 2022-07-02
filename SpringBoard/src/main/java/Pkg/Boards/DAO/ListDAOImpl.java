package Pkg.Boards.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Boards.VO.BoardVO;

@Repository
public class ListDAOImpl implements ListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> getBoardList(String idx) {
		List<BoardVO> boardList=sqlSession.selectList("Pkg.boards.list.selectBoard",idx);
		
		return boardList;
	}

	@Override
	public Map<String, Object> getProcBoardList(String idx) {
	
		 Map<String, Object> map=new HashMap<String,Object>();
		 map.put("idx",idx);
		 
		 sqlSession.selectList("Pkg.boards.list.procSelectBoard",map);
		
		 return map;
	}

}
