package Pkg.Admin.Services;

import java.util.ArrayList;
import java.util.Map;

import Pkg.Admin.DTO.AuthMenuDTO;

public interface DetailAuthesService {

	public Map<String, ArrayList<AuthMenuDTO>> getAuthMenuList(String authID, String menuID);
	
	public void saveAuthMenu(AuthMenuDTO dto);
}
