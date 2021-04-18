package zenkit.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.service.A03_defaultInfoService;
import zenkit.web.vo.A03_ProInfo;
import zenkit.web.vo.Department;

@Controller
public class A03_defaultInfoController {
	
	@Autowired(required=false)
	private A03_defaultInfoService service;
	
	// http://localhost:7080/zenkit/proInfo.do
	/*
	@GetMapping("proInfo.do")
	public String proInfo(@RequestParam("p_no") int p_no, Model d) {
		d.addAttribute("proInfo",service.proInfo(p_no));
		return "a03_project\\a02_defaultInfo";
	}
	*/
	// http://localhost:7080/zenkit/proInfo.do
	@RequestMapping("proInfo.do")
	public String proInfo(Model d, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		int a = Integer.parseInt((String) session.getAttribute("p_no"));
		int a = (int)session.getAttribute("p_no");
		
		d.addAttribute("proInfo",service.proInfo(a));
		return "a03_project\\a02_defaultInfo";
	}
	
	@GetMapping("proInfo_Edit.do")
	public String proInfo_Edit(@RequestParam("p_no") int p_no,Model d) {
		d.addAttribute("proInfo",service.proInfo(p_no));
		return "a03_project\\a02_defaultInfo_Edit";
	}

	@GetMapping("delproInfo.do")
	public String delproInfo(@RequestParam("p_no") int p_no) {
		service.delproInfo(p_no);
		return "a03_project\\a00_projectList";
	}
	@PostMapping("uptProInfo.do")
	public String uptProInfo(A03_ProInfo upt, Model d, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int a = (int)session.getAttribute("p_no");
		service.uptProInfo(upt);
		d.addAttribute("proInfo",service.proInfo(a));
		return "a03_project\\a02_defaultInfo";
	}
	@ModelAttribute("departments")
	public ArrayList<Department> getDepartments(){
		return service.getDepartments();
	}
	
	// http://localhost:7080/zenkit/jsonUser.do?d_no=2
	@RequestMapping("/jsonUser.do")
	public String jsonUser(@RequestParam("d_no") int d_no, Model d) {
		d.addAttribute("ulist",service.getUser(d_no));
		return "pageJsonReport";
	}	
}