package zenkit.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.service.A01_deptService;
import zenkit.web.vo.Department;

@Controller
@RequestMapping("department.do")
public class A01_deptController {
	
	@Autowired(required = false)
	A01_deptService service;

	// http://localhost:7080/zenkit/department.do?method=form
	@RequestMapping(params = "method=form")
	public String deptForm(Model m) {
		m.addAttribute("dept", new Department());
		return "/a01_admin/a01_dept_management";
	}
	@RequestMapping(params = "method=insert")
	public String deptInsert(@ModelAttribute("dept") Department dept) {
		if(dept != null && !dept.getD_name().equals(""))
			service.insertDept(dept);
		return "redirect:/department.do?method=form";
	}
	
	@RequestMapping(params = "method=delete")
	public String deptDelete(@RequestParam("d_name") String d_name) {
		if(d_name != null && !d_name.equals(""))
			service.deleteDept(d_name);
		return "redirect:/department.do?method=form";
	}
	
	
	@ModelAttribute("deptList")
	public ArrayList<Department> getDepts(){
		return service.getDeptList();
	}
}
