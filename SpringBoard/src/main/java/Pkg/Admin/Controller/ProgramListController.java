package Pkg.Admin.Controller;

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
import Pkg.Admin.DTO.ProgramDTO;
import Pkg.Admin.Services.MenuService;
import Pkg.Admin.Services.ProgramService;

@Controller
public class ProgramListController {

	@Autowired
	private ProgramService programService;
	
	@Autowired
	private MenuService menuService;
	
	
	@RequestMapping("ProgramList")
	public String getProgramList(String pName, Model model) {
		
		List<ProgramDTO> programList=null;
		List<MenuDTO>menuList=null;
		programList=programService.getProgramList(pName);
		menuList=menuService.getSMenuList();
		
		model.addAttribute("programList", programList);
		model.addAttribute("menuList",menuList);
		
		
		return "/Admin/ProgramList/programList";
	}
	
	@ResponseBody
	@RequestMapping("SaveProgramList")
	public String saveProgramList(@RequestBody Map<String,List<ProgramDTO>>MenuDatas) {
		List<ProgramDTO> params=MenuDatas.get("datas");
		programService.savePrograms(params);
		//저장하고 성공하면 성공했다는 메세지 return해줄꺼임
		System.out.println("");
		
		JSONObject jobj=new JSONObject();
		jobj.put("result", "success");
		
		return jobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping("MenuList")
	public String getMenuList() {
		List<MenuDTO> mList=menuService.getSMenuList();
		
		
		String menuID="";
		String menuName="";
		JSONArray jArray=new JSONArray();
		for(MenuDTO dto:mList) {
			
			menuID=dto.getMenuID();
			menuName=dto.getMenuName();
			
			JSONObject JmenuObj=new JSONObject();
			
			JmenuObj.put("menuID", menuID);
			JmenuObj.put("menuName", menuName);
			
			jArray.add(JmenuObj);
		}
		return jArray.toString();
	}
	
	@ResponseBody
	@RequestMapping("MenuDel")
	public String delMenus(@RequestBody Map<String, List<ProgramDTO>> map) {
		/*
		 {
		   delPid : [
			{pid : "P000001"},
			{pid : "P000002"},
			{pid : "P000003"}
		   ]
		 }
		 */
		
		List<ProgramDTO> arrDelList = map.get("delPid");
		
		programService.delPrograms(arrDelList);
		
		
		/*[
			{pid:"", pName:"", pFileName:"", fileUrl:"", menuID:""},
			{pid:"", pName:"", pFileName:"", fileUrl:"", menuID:""}
		  ]
		  
		  [
		  	{menuID:"", menuName:""},
		  	{menuID:"", menuName:""},
		  	{menuID:"", menuName:""},
		  	{menuID:"", menuName:""}
		  ]
		*/
		
		List<ProgramDTO> programList = programService.getProgramList("");
		List<MenuDTO> menuList = menuService.getSMenuList();
		
		JSONArray pArray=new JSONArray();
		for(ProgramDTO pdto:programList) {
			JSONObject pObj=new JSONObject();
			pObj.put("pID", pdto.getpID());
			pObj.put("pName", pdto.getpName());
			pObj.put("pFileName", pdto.getpFileName());
			pObj.put("fileUrl", pdto.getFileUrl());
			pObj.put("menuID", pdto.getMenuID());
			
			JSONArray mArray=new JSONArray();
			for(MenuDTO mdto:menuList) {
				JSONObject mObj=new JSONObject();
				mObj.put("menuID",mdto.getMenuID());
				mObj.put("menuName",mdto.getMenuName());
				mArray.add(mObj);
			}
			pObj.put("menus", mArray);
			pArray.add(pObj);
		}
		
		return pArray.toString();
		
	}
		
	
	
}
