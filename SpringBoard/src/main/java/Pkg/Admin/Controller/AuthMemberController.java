package Pkg.Admin.Controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import Pkg.Admin.DTO.AuthDTO;
import Pkg.Admin.DTO.AuthMemberDTO;
import Pkg.Admin.Services.AuthListService;
import Pkg.Admin.Services.AuthMemberService;

@Controller
public class AuthMemberController {

	@Autowired
	private AuthMemberService authMemberService;
	
	@Autowired
	private AuthListService authListService;
	
	@Autowired
	private HttpServletResponse response;
	
	@RequestMapping("MemberList")
	public String goMemberList() {
		return "/Admin/AuthList/MemberList";
	}
	
	@ResponseBody
	@RequestMapping("JsonMemberList")
	public String MemberList(String searchMName) {
		List<AuthMemberDTO> memberList=authMemberService.getAuthMemberList(searchMName);
		
		List<AuthDTO> authList=authListService.getAuthList("");
		
		/*
		 * [
		 * 	{"MID":"MEM0001","MNAME":"홍길동","AUTHID":"AUTH001","AUTHNAME":"전체권한"}
		 * 
		 * ]
		 * 
		 * */
		JSONArray jarray=new JSONArray();
		
		for(AuthMemberDTO dto:memberList) {
			JSONObject jobj=new JSONObject();
			jobj.put("MID", dto.getmID());
			jobj.put("MNAME", dto.getmName());
			jobj.put("AUTHID", dto.getAuthID());
			jobj.put("AUTHNAME", dto.getAuthName());
			jobj.put("MTHID", dto.getMthID());
			jarray.add(jobj);
		}
		
		//AuthList
		JSONArray jarray2=new JSONArray();
		JSONObject empty=new JSONObject();
		empty.put("AUTHID","" );
		empty.put("AUTHNAME","선택해주세요");
		jarray2.add(empty);
		
		for(AuthDTO dto:authList) {
			JSONObject jobj2=new JSONObject();
			jobj2.put("AUTHID", dto.getAuthID());
			jobj2.put("AUTHNAME",dto.getAuthName());
			
			jarray2.add(jobj2);
		}
		
		JSONObject resultObj=new JSONObject();
		try {
			resultObj.put("MemberList",jarray);
			resultObj.put("AuthList",jarray2);
			System.out.println(resultObj);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultObj.toString();
		
	}
	
	@RequestMapping("JsonAuthList")
	@ResponseBody
	public String JsonAuthList   (String authName) {
		
		List<AuthDTO> authList=authListService.getAuthList(authName);
		
		JSONArray jarray=new JSONArray();
		
		JSONObject empty=new JSONObject();
		empty.put("AUTHID","" );
		empty.put("AUTHNAME","선택해주세요");
		jarray.add(empty);
		
		for(AuthDTO dto:authList) {
			JSONObject jobj=new JSONObject();
			jobj.put("AUTHID", dto.getAuthID());
			jobj.put("AUTHNAME",dto.getAuthName());  
		
			
			jarray.add(jobj);
		}
		return jarray.toString();
	}
	
	@RequestMapping("MemberSave")
	public String MemberSave(String[] mID, String[] mName, String[] authID, String[] hVal, String[] mthID) {
		Map<String, String[]> map=new HashMap<String,String[]>();
		map.put("mID", mID);
		map.put("mName", mName);
		map.put("authID", authID);
		map.put("hVal", hVal);
		map.put("mthID", mthID);
		
		//authListService.saveAuthList(map);
		authMemberService.saveMemberList(map);
		
		return "/Admin/AuthList/MemberList";
	}
	
	
	
	
}
