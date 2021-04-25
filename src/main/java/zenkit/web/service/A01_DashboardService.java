package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_DashboardDao;
import zenkit.web.vo.DashBoard;

@Service
public class A01_DashboardService {

	@Autowired(required=false)
	private A01_DashboardDao dao;
	
	// 개인 대시보드 작업물 개수
	public int jobCnt(int u_no) {
		return dao.jobCnt(u_no);
	}
	// 개인 대시보드 프로젝트 개수
	public int projectCnt(int u_no) {
		return dao.projectCnt(u_no);
	}
	// 개인 대시보드 산출물 개수
	public int outputCnt(int u_no) {
		return dao.outputCnt(u_no);
	}	
	// 개인 대시보드 리스크 개수
	public int liskCnt(int u_no) {
		return dao.liskCnt(u_no);
	}
	// 개인 대시보드 프로젝트 별 기간
	public ArrayList<DashBoard> projectDate(int u_no) {
		return dao.projectDate(u_no);
	}
	// 개인 대시보드 프로젝트 작업상태 카운트 - pieChart
	public DashBoard projCntList(int u_no) {
		return dao.projCntList(u_no);
	}
	// 개인 대시보드 리스크 카운트 - pieChart
	public DashBoard riskCntList(int u_no){
		return dao.riskCntList(u_no);
	}	
	// 개인 대시보드 참여 프로젝트 현황
	public ArrayList<DashBoard> persProjList(int u_no){
		return dao.persProjList(u_no);
	}

	
	
	
}
