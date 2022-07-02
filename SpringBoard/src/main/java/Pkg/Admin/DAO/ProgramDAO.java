package Pkg.Admin.DAO;

import java.util.List;


import Pkg.Admin.DTO.ProgramDTO;

public interface ProgramDAO {

	public List<ProgramDTO> getProgramList(String pName);
	public void savePrograms(List<ProgramDTO> params);
	public void delPrograms(List<ProgramDTO> params);
}
