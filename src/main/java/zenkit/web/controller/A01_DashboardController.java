package zenkit.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import zenkit.web.service.A01_AllDashService;
import zenkit.web.service.A01_DashboardService;
import zenkit.web.service.A01_ProjDashService;
import zenkit.web.vo.User;

@Controller
@RequestMapping("dashboard.do")
public class A01_DashboardController {
	  
	@Autowired(required=false)
	private A01_DashboardService service;
	
	@Autowired(required=false)
	public A01_ProjDashService pservice;
	
	@Autowired(required=false)
	private A01_AllDashService aservice;
	
	/* 개인 대시보드 조회 */
	// http://localhost:7080/zenkit/dashboard.do?method=personalList
	@GetMapping(params="method=personalList")
	public String personalList(Model d, HttpServletRequest request ) {
		
		// 세션 설정
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		/* 개인 대시보드 */
		// 작업 개수
		d.addAttribute("jobCnt", service.jobCnt(user.getU_no()));
		// 프로젝트 개수
		d.addAttribute("projectCnt", service.projectCnt(user.getU_no()));
		// 산출물 개수
		d.addAttribute("outputCnt",service.outputCnt(user.getU_no()));
		// 리스크 개수
		d.addAttribute("riskCnt", service.liskCnt(user.getU_no()));
		// 진행율(날짜기준)
		d.addAttribute("projectDate",service.projectDate(user.getU_no()));
		// 프로젝트 작업상태 카운트 - pieChart
		d.addAttribute("projJobCnt", service.projCntList(user.getU_no()));
		// 리스크 카운트 - pieChart
		d.addAttribute("riskCntList", service.riskCntList(user.getU_no()));
		// 참여 프로젝트 현황
		d.addAttribute("persProjList", service.persProjList(user.getU_no()));
		
		/* 종합 대시보드 */
		// 종합 대시보드 프로젝트 리스트
		d.addAttribute("allProjList", aservice.allProjList());		
		// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
		d.addAttribute("selectDname", aservice.getDname());
		// 종합 대시보드 프로젝트 수행지표 리스트
		d.addAttribute("allCnts", aservice.getAllCnt());
		// 종합 대시보드 리스크 현황 - pieChart
		d.addAttribute("allRiskCnt", aservice.getAllRiskCnt());
		
		return "a01_dashboard\\a01_dashboard_personal";
	}
	
	// http://localhost:7080/zenkit/dashboard.do?method=projectList
	/*
	GetMapping(params="method=projectList")
	public String getProjList(Model d, HttpServletRequest request) {
		// 세션 설정
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		// 프로젝트 대시보드 셀렉트박스 프로젝트이름
		d.addAttribute("projNameList", pservice.getProjList(user.getU_no()));
		return "a01_dashboard\\a02_dashboard_project";
	}
	*/
	

}
