package Pkg.Admin.Controller;

import java.util.ArrayList;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Pkg.Admin.DTO.AuthDTO;
import Pkg.Admin.DTO.AuthMenuDTO;
import Pkg.Admin.Services.AuthListService;
import Pkg.Admin.Services.DetailAuthesService;

public class DetailAuthesController {

	@Autowired
	DetailAuthesService detailAuthesService;
	
	@Autowired
	AuthListService authListService;
	
	@RequestMapping("DetailAuthes")
	public String getDetailAuthes(String authID, String menuID, Model model) {
		
		if(authID == null || authID.equals("")) {authID = "AUTH001";}
		if(menuID == null) {menuID = "";}
		
		ArrayList<AuthDTO> authList = (ArrayList<AuthDTO>)authListService.getAuthList("");
		
		model.addAttribute("authList", authList);
		
		Map<String, ArrayList<AuthMenuDTO>> menuListMap = detailAuthesService.getAuthMenuList(authID, menuID);
		
		model.addAttribute("menuList", menuListMap.get("menuList"));
		model.addAttribute("subMenuList", menuListMap.get("subMenuList"));
		
		model.addAttribute("authID", authID);
		model.addAttribute("menuID", menuID);
				
		return "/Admin/AuthMenus/AuthMenus";
	}
	
	@ResponseBody
	@RequestMapping("SaveAuthMenus")
	public String saveAuthMenus(AuthMenuDTO dto) {
		
		
		detailAuthesService.saveAuthMenu(dto);
		
		JSONObject obj = new JSONObject();
		obj.put("datas", "success");
		return obj.toString();
	}
}
