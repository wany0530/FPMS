package zenkit.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import zenkit.web.service.A03_JobService;


@Controller
@RequestMapping("/chatt.do")
public class A05_ChattingController {
	@Autowired(required = false)
	A03_JobService service;
	
	// http://localhost:7080/zenkit/chatt.do?method=chatt
	@RequestMapping(params = "method=chatt")
	public String chatt(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		int p_no = (int) session.getAttribute("p_no");
		m.addAttribute("project", service.projectGet(p_no)); // 특정 프로젝트 정보 데이터 (PM인지 예외처리할때 사용, 프로젝트명 select을 위해 사용)
		return "a03_project/a04_chatt";
	}
}
