package Pkg.Admin.Services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import Pkg.Admin.DTO.AuthMemberDTO;

public interface AuthMemberService {

	public List<AuthMemberDTO> getAuthMemberList(String searchMName);
	
	public void saveMemberList(Map<String, String[]> map);
}
