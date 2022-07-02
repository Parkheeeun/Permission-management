package Pkg.Admin.Services;

import java.util.List;
import java.util.Map;

import Pkg.Admin.DTO.ProgramDTO;

public interface ProgramService {

	public List<ProgramDTO> getProgramList(String pName);
	public void savePrograms(List<ProgramDTO> params);
	public void delPrograms(List<ProgramDTO> params);
}
