package Pkg.Admin.Services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Pkg.Admin.DAO.MenuListDAO;
import Pkg.Admin.DTO.MenuDTO;

@Service
public class MenuListServiceImpl implements MenuListService {

	@Autowired
	private MenuListDAO menuListDAO;
	
	@Override
	public List<MenuDTO> getMenuList(String menuName) {
		
		return menuListDAO.getMenuList(menuName);
	}
	
	@Override
	public void saveMenus(Map<String, String[]> params) {
		
		 menuListDAO.saveMenus(params);
	}
	
	@Override
	public void delMenus(String[] params) {
		menuListDAO.delMenus(params);
	}
	
	@Override
	public List<MenuDTO> getSubMenuList(String menuID){
		return menuListDAO.getSubMenuList(menuID);
	}
	
	@Override
	public void saveSubMenus(List<MenuDTO>params) {
		menuListDAO.saveSubMenus(params);
	}

}
