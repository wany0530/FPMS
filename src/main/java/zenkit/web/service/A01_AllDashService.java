package zenkit.web.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_AllDashDao;
import zenkit.web.vo.AllDashBoard;

@Service
public class A01_AllDashService {
	
	@Autowired(required=false)
	private A01_AllDashDao dao;
	// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
	public ArrayList<AllDashBoard> getDname() {
		return dao.getDname();
	}	
	
	// 종합 대시보드 프로젝트 리스트
	public ArrayList<AllDashBoard> allProjList(){
		return dao.allProjList();
	}
	// 종합 대시보드 프로젝트 리스트 (ajax 부서별 조회)
	public ArrayList<AllDashBoard> deptProjList(int d_no){
		ArrayList<AllDashBoard> allDash = dao.deptProjList(d_no);
		for(AllDashBoard a : allDash) {
			SimpleDateFormat sDate = new SimpleDateFormat("YYYY. MM. dd");		
			a.setP_startD_s(sDate.format(a.getP_startD()));
			a.setP_endD_s(sDate.format(a.getP_endD()));
		}
		
		return allDash;	
	}
	
	// 종합 대시보드 프로젝트 수행지표 리스트
	public ArrayList<AllDashBoard> getAllCnt(){
		return dao.getAllCnt();
	}
	
	// 종합 대시보드 리스크 현황 - pieChart
	public AllDashBoard getAllRiskCnt() {
		return dao.getAllRiskCnt();
	}
}
