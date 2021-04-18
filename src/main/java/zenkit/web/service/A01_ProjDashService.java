package zenkit.web.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_ProjDashDao;
import zenkit.web.vo.ProjDashBoard;

@Service
public class A01_ProjDashService {
	
	@Autowired(required=false)
	public A01_ProjDashDao dao;	
	
	// 프로젝트 대시보드 셀렉트박스 프로젝트이름 
	public ArrayList<ProjDashBoard> getProjList(int u_no){
		return dao.getProjList(u_no);
	}
	
	// 프로젝트 대시보드 p_no별 프로젝트정보
	public ArrayList<ProjDashBoard> projDashList(int p_no){
		
		ArrayList<ProjDashBoard> projs = dao.projDashList(p_no);
		// 날짜 포맷 변경
		for(ProjDashBoard p : projs) {
			SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
			String startD = sDate.format(p.getP_startD());
			String endD = sDate.format(p.getP_endD());
			
			p.setP_startD_s(startD);
			p.setP_endD_s(endD);
		}
		
		return projs;
	}
	// 프로젝트 대시보드 p_no별 참여인력(리소스)
	public ArrayList<ProjDashBoard> projDashResList(int p_no){
		return dao.projDashResList(p_no);
	}
	
	// 프로젝트 주요작업 현황 6개 
	public ArrayList<ProjDashBoard> projJobList(int p_no){
		return dao.projJobList(p_no);
	}
}




