package zenkit.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.service.A02_CalendarService;
import zenkit.web.vo.Calendar2;
import zenkit.web.vo.User;
@Controller
@RequestMapping("calendar.do")
public class A02_CalendarController {
	
	@Autowired(required=false)
	private A02_CalendarService service;
	
	// http://localhost:7080/zenkit/calendar.do?method=list
	@GetMapping(params="method=list")
	public String list() {
		return "a02_myTask\\calendar";
	}
	
	// http://localhost:7080/zenkit/calendar.do?method=data 
	@GetMapping(params="method=data")
	public String data(Model d, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		d.addAttribute("list",service.calenList(user.getU_no()));
		
		return "pageJsonReport";
	}
	// 등록 후, 정상된 것을 model로 넘겨준다.
	// http://localhost:7080/zenkit/calendar.do?method=insert 
	@PostMapping(params="method=insert")
	public String insert(Calendar2 ins, Model d) {
		service.insertCalendar(ins);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}

	@PostMapping(params="method=update")
	public String update(Calendar2 upt, Model d) {
		service.updateCalen(upt);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	@PostMapping(params="method=delete")
	public String delete(@RequestParam("id") int id, Model d) {
		service.deleteCalen(id);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
}
