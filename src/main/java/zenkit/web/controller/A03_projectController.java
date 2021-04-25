package zenkit.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.dto.AddResource;
import zenkit.web.dto.MyRisk;
import zenkit.web.dto.ResourceName;
import zenkit.web.dto.SchProject;
import zenkit.web.service.A03_JobService;
import zenkit.web.service.A03_projectService;
import zenkit.web.vo.Job2;
import zenkit.web.vo.Project;
import zenkit.web.vo.User;

@Controller
@RequestMapping("project.do")
public class A03_projectController {
	
	@Autowired
	private A03_projectService service;
	
	// http://localhost:7080/zenkit/project.do?method=form
	@GetMapping(params = "method=form")
	public String projectListForm(HttpServletRequest request, Model m) {
		
		return "/a03_project/a00_projectList";
	}
	// http://localhost:7080/zenkit/project.do?method=form
	@PostMapping(params = "method=form")
	public String projectListForm(Project pro, HttpServletRequest req) {
		
		// 프로젝트 번호 session 처리
		HttpSession session = req.getSession();
		session.setAttribute("p_no", pro.getP_no());
		
		return "redirect:/project.do?method=detail_1";
	}
	
	// http://localhost:7080/zenkit/project.do?method=detail_1
	@RequestMapping(params = "method=detail_1")
	public String detailForm_1(HttpServletRequest req, Model m) {
		
		// 프로젝트 번호 session으로 받기
		HttpSession session = req.getSession();
		int p_no = (int)session.getAttribute("p_no");
		User user = (User)session.getAttribute("sesMem");
		
		// 본인의 작업 리스트
		m.addAttribute("jobList",service.getJobList(p_no, user.getU_no()));
		// 프로젝트 기본정보
		m.addAttribute("proInfo",service.getProjectInfo(p_no));
		// 프로젝트 PM
		m.addAttribute("pm",service.getPM(p_no));
		// 프로젝트 참여인원
		m.addAttribute("resourceList",service.getProjectResource(p_no));
		// 프로젝트 작업 상태 가져오기(카운트 값)
		m.addAttribute("jobStatuCnt",service.getJobState(p_no));
		// 프로젝트 리스크 상태 가져오기(카운트 값)
		m.addAttribute("riskStatuCnt",service.getRiskState(p_no));
		// 내가 조치해야할 리스크 목록 가져오기
		m.addAttribute("myRiskList",service.getMyRisk(new MyRisk(p_no, user.getU_id())));
		
		return "/a03_project/a01_detailInfo";
	}
	
	// http://localhost:7080/zenkit/project.do?method=detail_3
	@GetMapping(params = "method=detail_3")
	public String detailForm_3(HttpServletRequest req, Model m) {
		
		// session받기 (프로젝트 번호, 접속유저)
		HttpSession session = req.getSession();
		int p_no = (int)session.getAttribute("p_no");
		User user = (User)session.getAttribute("sesMem");
		
		// 프로젝트 참여인원
		ArrayList<ResourceName> joinOfpeple = service.getProjectResource(p_no);
		m.addAttribute("resourceList",joinOfpeple);
		
		// 해당 부서인원 리스트 (현재 참여인원은 제외)
		int d_no = user.getD_no();
		ArrayList<ResourceName> deptOfpeple = service.getDeptResource(d_no, p_no);
		
		m.addAttribute("deptPersonList", deptOfpeple);
		return "/a03_project/a03_resource";
	}
	// http://localhost:7080/zenkit/project.do?method=detail_3
	@PostMapping(params = "method=detail_3")
	public String detailForm_3(@RequestParam("u_name") String u_name,
							@RequestParam("btnState") String btnState,
							HttpServletRequest req) {
		
		// session받기 (프로젝트 번호)
		HttpSession session = req.getSession();
		int p_no = (int)session.getAttribute("p_no");
		
		AddResource resource = new AddResource(p_no, u_name);
		if(btnState.equals("add")) 
			service.addResource(resource); // 프로젝트 참여시키기
		else
			service.delResource(resource); // 프로젝트 제외시키기
		
		return "redirect:/project.do?method=detail_3";
	}
	// http://localhost:7080/zenkit/project.do?method=regForm
	@GetMapping(params = "method=regForm")
	public String proRegForm(Model m) {
		
		// 현재 날짜 및 한달 후 날짜 계산
		Calendar cal = Calendar.getInstance();
		Date date = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
		
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		System.out.println(date);
		
		m.addAttribute("startDay", fm.format(date));
		m.addAttribute("endDay", fm.format(cal.getTime()));
		
		return "/a03_project/a00_regProject";
	}
	@PostMapping(params = "method=regForm")
	public String proRegForm(Project pro, Model m) {
		service.projectReg(pro);
		
		m.addAttribute("regSucc", "등록완료");
		
		return "/a03_project/a00_regProject";
	}
	
	// http://localhost:7080/zenkit/project.do?method=data
	@RequestMapping(params = "method=data")
	public String projectList(HttpServletRequest req, Model d, SchProject sch) {
		
		if(sch.getPageSize() != 0) {
			int size = sch.getPageSize(); // 사용자 입력 : 페이지 사이즈
			int page = sch.getCurrPage(); // 사용자 입력 : 현재 페이지
			int startNum = 1 + (page-1)*size; // 조회할 ROWNUM 시작번호 
			int endNum = page * size; // 조회할 ROWNUM 끝 번호
			
			int cnt = service.getProListCnt(sch); // 검색어를 통해 조회된 리스트의 갯수
			int startPage = page-(page-1)%5; // 페이지 버튼 시작 번호
			int lastPage = ((cnt%size) == 0)? (cnt/size) : (cnt/size)+1;  // 페이지 최종 번호
			int endPage = ((startPage+4 < lastPage)?startPage+4:lastPage); // 페이지 버튼 끝 번호 
			
			sch.setCount(cnt);
			sch.setLastPage(lastPage);
			sch.setStartNum(startNum);
			sch.setEndNum(endNum);
			sch.setStartPage(startPage);
			sch.setEndPage(endPage);
		} else {
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("sesMem");
			
			sch.setStartNum(0);
			sch.setEndNum(999999);
			sch.setSchWord("");
			sch.setU_no(user.getU_no());
		}
		
		d.addAttribute("projectList", service.getProList(sch));
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/zenkit/project.do?method=jobdata
	@RequestMapping(params = "method=jobdata")
	public String getjobData(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		int p_no = (int)session.getAttribute("p_no");
		User user = (User)session.getAttribute("sesMem");
		
		m.addAttribute("userJob", service.getJobListJson(p_no, user.getU_no()));
		m.addAttribute("totProgress", service.getTotProgress(p_no));
		return "pageJsonReport";
	}
	// http://localhost:7080/zenkit/project.do?method=userJob
	@RequestMapping(params = "method=userJob")
	public String getUserJob(@RequestParam("p_no") int p_no, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		
		m.addAttribute("jobList", service.getJobList(p_no, user.getU_no()));
		return "pageJsonReport";
	}
	
	// http://localhost:7080/zenkit/project.do?method=jobCnt
	@RequestMapping(params = "method=jobCnt")
	public String getJobCnt(@RequestParam("u_no") int u_no, HttpServletRequest request, Model m) {
		
		// 프로젝트 번호 세션으로 받기
		HttpSession session = request.getSession();
		int p_no = (int)session.getAttribute("p_no");
		
		m.addAttribute("jobCnt", service.getJobCnt(p_no, u_no));
		return "pageJsonReport";
	}
	
	// http://localhost:7080/zenkit/project.do?method=updateManager
	@RequestMapping(params = "method=updateManager")
	public void updateManager(@RequestParam("u_no") int u_no, HttpServletRequest request) {
		
		// 프로젝트 번호 세션으로 받기
		HttpSession session = request.getSession();
		int p_no = (int)session.getAttribute("p_no");
		
		service.updateManager(p_no, u_no);
	}
}
