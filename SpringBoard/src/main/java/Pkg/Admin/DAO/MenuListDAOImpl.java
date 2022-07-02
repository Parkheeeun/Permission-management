package Pkg.Admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Admin.DTO.MenuDTO;

@Repository
public class MenuListDAOImpl implements MenuListDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MenuDTO> getMenuList(String menuName) {
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("menuName", menuName);
		
		sqlSession.selectList("selectMenuList", map);
		
		List<MenuDTO>menuList=(List<MenuDTO>)map.get("result");
		return menuList;
	}
	
	@Override
	public void saveMenus(Map<String, String[]> params) {
		String[] menuID=(String[])params.get("menuID");
		String[] menuName=(String[])params.get("menuName");
		String[] menuSeq=(String[])params.get("menuSeq");
		//String[] menuLvl=(String[])params.get("menuLvl");
		String[] hVal=(String[])params.get("hVal");
		
		Map<String, Object> map=null;
		
		for(int i=0; i<menuID.length; i++) {
			if(!hVal[i].equals("")) {
				map=new HashMap<String,Object>();
				map.put("menuID",menuID[i]);
				map.put("menuName",menuName[i]);
				map.put("menuSeq",menuSeq[i]);
				
				sqlSession.selectList("saveMenus",map);
		
			}
		}
	}
	
	@Override
	public void delMenus(String[] params) {
		for(String menuID:params) {
			
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("menuID", menuID);
			
			sqlSession.selectList("delMenus",map);
		}
	}
	
	@Override
	public List<MenuDTO> getSubMenuList(String menuID){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("menuID", menuID);
		
		sqlSession.selectList("selectSubMenuList", map);
		
		List<MenuDTO>subMenuList=(List<MenuDTO>)map.get("result");
		return subMenuList;
	}
	
	
	@Override
	public void saveSubMenus(List<MenuDTO>params) {
		
		
		Map<String, Object> map=null;
		
		for(MenuDTO dto: params) {
				map=new HashMap<String,Object>();
				map.put("menuID",dto.getMenuID());
				map.put("menuName",dto.getMenuName());
				map.put("menuSeq",dto.getMenuSeq());
				map.put("menuLvl",dto.getMenuLvl());
				map.put("parentID",dto.getParentID());
				
				sqlSession.selectList("saveSubMenus",map);
		}
	}
	
	
	
	

}
