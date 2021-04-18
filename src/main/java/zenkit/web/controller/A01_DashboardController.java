package zenkit.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		d.addAttribute("jobCnt", service.jobCnt(user.getU_no()));
		d.addAttribute("projectCnt", service.projectCnt(user.getU_no()));
		d.addAttribute("outputCnt",service.outputCnt(user.getU_no()));
		d.addAttribute("projectDate",service.projectDate(user.getU_no()));
		d.addAttribute("projectList", service.projectList(user.getU_no()));
		// 종합 대시보드 프로젝트 리스트
		d.addAttribute("allProjInfo", aservice.allProjList());
		// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -진행상태
		d.addAttribute("selectProgress", aservice.getProgress());
		// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -부서명
		d.addAttribute("selectDname", aservice.getDname());
		// 종합 대시보드 주요 프로젝트 현황 셀렉트박스 -연도
		d.addAttribute("year1", aservice.getYear1());
		// 종합 대시보드 프로젝트 수행지표 리스트
		d.addAttribute("allCnts", aservice.getAllCnt());
		
		return "a01_dashboard\\a01_dashboard_personal";
	}
	
	// http://localhost:7080/zenkit/dashboard.do?method=projectList
	@GetMapping(params="method=projectList")
	public String getProjList(Model d, HttpServletRequest request) {
		// 세션 설정
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		// 프로젝트 대시보드 셀렉트박스 프로젝트이름
		d.addAttribute("projNameList", pservice.getProjList(user.getU_no()));
		return "a01_dashboard\\a02_dashboard_project";
	}
	
	// http://localhost:7080/zenkit/jsonAlist.do?d_no=5
	@RequestMapping("/jsonAlist.do")
	public String jsonAlist(@RequestParam("d_no") int d_no, Model d) {		
		
		return "pageJsonReport";
	}
	
	
	
	/* 종합 대시보드 조회 */
	// http://localhost:7080/zenkit/dashboard.do?method=allList
	@GetMapping(params="method=allList")
	public String allList() {
		return "a01_dashboard\\a03_dashboard_all";
	}
	
	
	/* 부서 대시보드 조회 */
	// http://localhost:7080/zenkit/dashboard.do?method=departList
	@GetMapping(params="method=departList")
	public String departList() {
		return "a01_dashboard\\a04_dashboard_department";
	}
	
	

}
