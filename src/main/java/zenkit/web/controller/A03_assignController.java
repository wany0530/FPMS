package zenkit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class A03_assignController {
	// http://localhost:7080/zenkit/assign.do
	@RequestMapping("assign.do")
	public String assign() {
		return "/a03_project/a05_assign";
	}
}
