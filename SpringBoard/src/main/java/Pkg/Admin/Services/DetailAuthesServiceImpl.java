package Pkg.Admin.Services;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Admin.DAO.DetailAuthesDAO;
import Pkg.Admin.DTO.AuthMenuDTO;

@Repository
public class DetailAuthesServiceImpl implements DetailAuthesService {

	@Autowired
	DetailAuthesDAO detailAuthesDAO;
	
	@Override
	public Map<String, ArrayList<AuthMenuDTO>> getAuthMenuList(String authID, String menuID) {
		
		return detailAuthesDAO.getAuthMenuList(authID, menuID);
	}

	@Override
	public void saveAuthMenu(AuthMenuDTO dto) {
		detailAuthesDAO.saveAuthMenu(dto);
	}
}
