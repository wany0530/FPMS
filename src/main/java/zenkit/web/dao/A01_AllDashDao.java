package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.AllDashBoard;

@Repository
public interface A01_AllDashDao {
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
	public ArrayList<AllDashBoard> getDname();	
	 
	// 종합 대시보드 프로젝트 리스트
	public ArrayList<AllDashBoard> allProjList();
	// 종합 대시보드 프로젝트 리스트 (ajax 부서별 조회)
	public ArrayList<AllDashBoard> deptProjList(int d_no);

	// 종합 대시보드 프로젝트 수행지표 리스트
	public ArrayList<AllDashBoard> getAllCnt();		
	
	// 종합 대시보드 리스크 현황 - pieChart
	public AllDashBoard getAllRiskCnt();
	
	
}
