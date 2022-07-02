package Pkg.Admin.ErrorHandler;

import java.util.ArrayList;
import java.util.Map;

public class ErrorHandler {

	//DB에러처리
	public void goDBErrorPage(Map<String, ArrayList<String>> map) {
		for(String strKey:map.keySet()) {
			ArrayList<String> err=map.get(strKey);
			
			if(strKey.equals("errCode")) {
				for(String strRst:err) {
					if(!strRst.equals("suc")) {
						
					}
				}
			}
		}
	}
	
	
}
