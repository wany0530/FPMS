package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_AllDashDao;
import zenkit.web.vo.AllDashBoard;

@Service
public class A01_AllDashService {
	
	@Autowired(required=false)
	private A01_AllDashDao dao;
	
	// 종합 대시보드 프로젝트 리스트
	public ArrayList<AllDashBoard> allProjList(){
		return dao.allProjList();
	}
	// 종합 대시보드 프로젝트 리스트 (부서별)-->
	public ArrayList<AllDashBoard> deptProjList(int d_no){
		return dao.deptProjList(d_no);	
	}
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -진행상태
	public ArrayList<AllDashBoard> getProgress() {
		return dao.getProgress();
	}

	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
	public ArrayList<AllDashBoard> getDname() {
		return dao.getDname();
	}
		
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -연도
	public ArrayList<AllDashBoard> getYear1() {
		return dao.getYear1();
	}
	
	// 종합 대시보드 프로젝트 수행지표 리스트
	public ArrayList<AllDashBoard> getAllCnt(){
		return dao.getAllCnt();
	}
	
	// 종합 대시보드 프로젝트 수행지표 리스트 (부서 내 프로젝트별)
	public ArrayList<AllDashBoard> getAllProjCnt(int d_no){
		return dao.getAllProjCnt(d_no);
	}
}
