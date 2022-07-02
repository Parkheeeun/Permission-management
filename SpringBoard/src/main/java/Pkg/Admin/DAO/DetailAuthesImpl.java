package Pkg.Admin.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Admin.DTO.AuthMenuDTO;

@Repository
public class DetailAuthesImpl implements DetailAuthesDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Map<String, ArrayList<AuthMenuDTO>> getAuthMenuList(String authID, String menuID) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authID", authID);
		map.put("menuID", menuID);
		
		sqlSession.selectList("selectAuthMenuList", map);
		
		Map<String, ArrayList<AuthMenuDTO>> authMenuMap = new HashMap<String, ArrayList<AuthMenuDTO>>();
		
		authMenuMap.put("menuList", (ArrayList<AuthMenuDTO>)map.get("result1"));
		authMenuMap.put("subMenuList", (ArrayList<AuthMenuDTO>)map.get("result2"));
		
		return authMenuMap;
	}

	@Override
	public void saveAuthMenu(AuthMenuDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("amID", dto.getAmID());
		map.put("auth_Sel", dto.getAuth_Sel());
		map.put("auth_Ins", dto.getAuth_Ins());
		map.put("auth_Up", dto.getAuth_Up());
		map.put("auth_Del", dto.getAuth_Del());
		map.put("auth_FileUp", dto.getAuth_FileUp());
		map.put("auth_FileDn", dto.getAuth_fileDn());
		
		sqlSession.selectList("saveAuthMenu", map);
		
	}
}
