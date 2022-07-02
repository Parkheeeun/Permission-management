package Pkg.Admin.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Pkg.Admin.DTO.MenuDTO;
import Pkg.Admin.Services.MenuListService;

@Controller
public class AuthMenuListController {

	@Autowired
	private MenuListService menuListService;
	
	@RequestMapping("MenusList")
	public String getMenulist(String sMenuName, Model model) {
		
		List<MenuDTO> menuList=menuListService.getMenuList(sMenuName);
		
		model.addAttribute("menuList",menuList);
		return "/Admin/MenuList/MenuList";
	}
	
	
	@RequestMapping("SaveMenu")
	public String saveMenus(String[] menuID,String[] menuName, String[] menuSeq, String[] menuLvl, String[] parentID, String[] hVal) {
		Map<String, String[]> map=new HashMap<String,String[]>();
		map.put("menuID", menuID);
		map.put("menuName", menuName);
		map.put("menuSeq", menuSeq);
		map.put("menuLvl", menuLvl);
		map.put("parentID", parentID);
		map.put("hVal", hVal);
		
		menuListService.saveMenus(map);
		
		return "redirect:MenusList";
	}
	
	
	@RequestMapping("delMenus")
	public String delMenus(String[] delMenuID) {
		
		
		menuListService.delMenus(delMenuID);
		return "redirect:MenusList";
	}
	
	@ResponseBody
	@RequestMapping("SubMenuList")
	public String getSubMenus(String menuID) {
		
		List<MenuDTO> subMenuList=menuListService.getSubMenuList(menuID);
		JSONArray arrSubMenuList=new JSONArray();
		for(MenuDTO dto:subMenuList) {
			JSONObject obj=new JSONObject();
			obj.put("menuID", dto.getMenuID());
			obj.put("menuName", dto.getMenuName());
			obj.put("menuSeq", dto.getMenuSeq());
			obj.put("menuLvl", dto.getMenuLvl());
			obj.put("parentID", dto.getParentID());
			arrSubMenuList.add(obj);
		}
		
		return arrSubMenuList.toString();
	}
	
	
	@ResponseBody
	@RequestMapping("saveSubMenu")
	public String saveSubMenu(@RequestBody Map<String,List<MenuDTO>> params) {
		List<MenuDTO> saveList=params.get("subMenuList");
		
		
		menuListService.saveSubMenus(saveList);
		
		JSONObject obj=new JSONObject();
		obj.put("result", "success");
		
		return obj.toString();
	}
	
	
	
}
