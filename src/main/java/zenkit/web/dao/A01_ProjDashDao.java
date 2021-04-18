package zenkit.web.dao;
 
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.ProjDashBoard;

@Repository
public interface A01_ProjDashDao {
	
	//프로젝트 대시보드 셀렉트박스 프로젝트이름 
	public ArrayList<ProjDashBoard> getProjList(int u_no);
	
	//프로젝트 대시보드 p_no별 프로젝트정보 -->
	public ArrayList<ProjDashBoard> projDashList(int p_no);
	
	// 프로젝트 대시보드 p_no별 참여인력(리소스)
	public ArrayList<ProjDashBoard> projDashResList(int p_no);
	
	// 프로젝트 주요작업 현황 6개 
	public ArrayList<ProjDashBoard> projJobList(int p_no);
	
}
