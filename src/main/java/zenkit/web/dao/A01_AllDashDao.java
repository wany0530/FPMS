package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.AllDashBoard;

@Repository
public interface A01_AllDashDao {
	
	// 종합 대시보드 프로젝트 리스트
	public ArrayList<AllDashBoard> allProjList();
	// 종합 대시보드 프로젝트 리스트 (부서별)-->
	public ArrayList<AllDashBoard> deptProjList(int d_no);
	
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -진행상태
	 public ArrayList<AllDashBoard> getProgress();

	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
	public ArrayList<AllDashBoard> getDname(); 
	
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -연도
	public ArrayList<AllDashBoard> getYear1();
	
	// 종합 대시보드 프로젝트 수행지표 셀렉트박스 -연도
	public ArrayList<AllDashBoard> getYear2();

	// 종합 대시보드 프로젝트 수행지표 리스트
	public ArrayList<AllDashBoard> getAllCnt();
	
	// 종합 대시보드 프로젝트 수행지표 리스트 (부서 내 프로젝트별)
	public ArrayList<AllDashBoard> getAllProjCnt(int d_no);
}
