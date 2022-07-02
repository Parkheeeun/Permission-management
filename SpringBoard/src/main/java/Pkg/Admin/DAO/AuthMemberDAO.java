package Pkg.Admin.DAO;


import java.util.List;
import java.util.Map;

import Pkg.Admin.DTO.AuthMemberDTO;

public interface AuthMemberDAO {

	
	public List<AuthMemberDTO> getAuthMemberList(String searchMName);
	
	public void saveMemberList(Map<String, String[]> map);
}
