package Pkg.Admin.Services;

import java.util.List;
import java.util.Map;

import Pkg.Admin.DTO.MenuDTO;

public interface MenuListService {

	public List<MenuDTO> getMenuList(String menuName);
	
	public void saveMenus(Map<String, String[]> params);
	
	public void delMenus(String[] params);
	
	public List<MenuDTO> getSubMenuList(String menuID);
	
	public void saveSubMenus(List<MenuDTO>params);
}
