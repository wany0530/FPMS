package zenkit.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.service.A01_AllDashService;
import zenkit.web.service.A01_ProjDashService;

@Controller
public class A01_DashJsonController {

	@Autowired(required=false)
	public A01_ProjDashService pservice;
	
	@Autowired(required=false)
	public A01_AllDashService aservice;
	
	// http://localhost:7080/zenkit/jsonPlist.do?p_no=1
	@RequestMapping("/jsonPlist.do")
	public String jsonPlist(@RequestParam("p_no") int p_no, Model d) {
		// 프로젝트 대시보드 p_no별 프로젝트정보
		d.addAttribute("plist", pservice.projDashList(p_no));
		// 프로젝트 대시보드 p_no별 참여인력(리소스)
		d.addAttribute("rlist", pservice.projDashResList(p_no));
		// 프로젝트 주요작업 현황 6개 
		d.addAttribute("jlist", pservice.projJobList(p_no));		
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/zenkit/jsonAlist.do?d_no=5
	
	@RequestMapping("/jsonAlist.do") 
	public String jsonAlist(@RequestParam("d_no") int d_no , Model d) {
		// 종합 대시보드 프로젝트 수행지표 리스트 (ajax 부서별 조회)
		d.addAttribute("deptProjList", aservice.deptProjList(d_no));
		
		return "pageJsonReport";
	}

	
		
}
