package Pkg.Admin.DAO;

import java.util.ArrayList;
import java.util.Map;

import Pkg.Admin.DTO.AuthMenuDTO;

public interface DetailAuthesDAO {
	public Map<String, ArrayList<AuthMenuDTO>> getAuthMenuList(String authID, String menuID);
		
		public void saveAuthMenu(AuthMenuDTO dto);
}
