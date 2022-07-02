package Pkg.Admin.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Admin.DTO.AuthMemberDTO;
@Repository
public class AuthMemberDAOImpl implements AuthMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<AuthMemberDTO> getAuthMemberList(String searchMName) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("searchMName", searchMName);
		
		sqlSession.selectList("selectAuthMemberList",map);
		
		List<AuthMemberDTO> authMemberList=(List<AuthMemberDTO>)map.get("result");
		return authMemberList;
	}


	@Override
	public void saveMemberList(Map<String, String[]> map) {
		String[] mID=(String[])map.get("mID");
		String[] mName=(String[])map.get("mName");
		String[] authID=(String[])map.get("authID");
		String[] mthID=(String[])map.get("mthID");
		String[] hVal=(String[])map.get("hVal");
		
		Map<String, Object> params=null;
		String errCode="";
		String errMsg="";
		
		for(int i=0; i<mID.length; i++) {
			if(hVal[i] !=null) {
				params=new HashMap<String,Object>();
				params.put("mID",mID[i]);
				params.put("mName",mName[i]);
				params.put("authID",authID[i]);
				params.put("mthID",mthID[i]);
				
				
				sqlSession.selectList("saveMemberList",params);
				
				errCode=(String)params.get("errCode");
				errMsg=(String)params.get("errMsg");
			}
		}
		
	}

	
}
