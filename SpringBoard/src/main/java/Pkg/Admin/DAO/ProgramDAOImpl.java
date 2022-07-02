package Pkg.Admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Pkg.Admin.DTO.ProgramDTO;

@Repository
public class ProgramDAOImpl implements ProgramDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProgramDTO> getProgramList(String pName){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pName", pName);
		
		
		sqlSession.selectList("selectProgramList",map);
		
		List<ProgramDTO>programList=(List<ProgramDTO>)map.get("result");
		
		return programList;	
	}
	
	
	@Override
	public void savePrograms(List<ProgramDTO> params) {
		String result="";
		try {
			String pID="";
			String menuID="";
			String pName="";
			String pFileName="";
			String fileUrl="";
			for(ProgramDTO dto:params) {
				pID=dto.getpID();
				menuID=dto.getMenuID();
				pName=dto.getpName();
				pFileName=dto.getpFileName();
				fileUrl=dto.getFileUrl();
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("pID", pID);
				map.put("menuID", menuID);
				map.put("pName", pName);
				map.put("pFileName", pFileName);
				map.put("fileUrl", fileUrl);
				
				sqlSession.selectList("savePrograms",map);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			result="success";
		}
	}
	
	@Override
	public void delPrograms(List<ProgramDTO> params) {
		
		for(ProgramDTO dto : params) {
			String pID = dto.getpID();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("pID", pID);
			
			sqlSession.selectList("delPrograms", map);
		}
	}
	
}
