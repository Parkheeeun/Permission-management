package Pkg.Admin.Services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Pkg.Admin.DAO.ProgramDAO;
import Pkg.Admin.DTO.ProgramDTO;

@Service
public class ProgramServiceImpl implements ProgramService{

	@Autowired
	private ProgramDAO programDAO;
	
	@Override
	public List<ProgramDTO> getProgramList(String pName) {
		
		return programDAO.getProgramList(pName);

	}
	
	@Override
	public void savePrograms(List<ProgramDTO> params) {
		programDAO.savePrograms(params);
	}
	
	@Override
	public void delPrograms(List<ProgramDTO> params) {
		programDAO.delPrograms(params);
	}

}
