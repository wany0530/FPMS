package zenkit.web.controller;


import javax.servlet.ServletRequest;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import zenkit.web.service.A03_riskService;
import zenkit.web.vo.Risk;


@Controller
public class A03_riskController {
	
	@Autowired(required = false)
	private A03_riskService service;
	//http://localhost:7080/zenkit/zenkit.do?method=riskList
	@RequestMapping(params="method=riskList")
	public String riskList(@ModelAttribute("sch") Risk sch, Model d) {
		d.addAttribute("riskList",service.riskList(sch));
		// return "a06_project/a06_riskDetail";
		return "a03_project//a06_riskList";
	}
	//http://localhost:7080/zenkit/zenkit.do?method=riskInsertForm
	   @RequestMapping(params="method=riskInsertForm")
	   public String riskInsertForm(@ModelAttribute("risk") Risk risk) {
	      return "a03_project//a06_riskInsert";
	    //  return "a06_project/a06_riskDetail";
	   }
	   
   //http://localhost:7080/zenkit/zenkit.do?method=riskInsert
	   @RequestMapping(params="method=riskInsert")
	   public String riskInsert( Risk insert, Model d) {
	      System.out.println(insert.getR_name());
	      System.out.println(insert.getR_content());
	      System.out.println(insert.getR_file());
	      System.out.println(insert.getR_rcontent());
	      System.out.println(insert.getR_receive());
	      System.out.println(insert.getRs_name());
	      service.riskInsert(insert);
	      d.addAttribute("proc","riskInsert");   
	      return "a03_project//a06_riskInsert";
	  //     return "a06_project/a06_riskDetail";
	   }

	
	   //http://localhost:7080/zenkit/zenkit.do?method=detail
	   @RequestMapping(params="method=detail")
	   public String riskDetail(@RequestParam  int r_no, Model d, HttpServletRequest request){
	      HttpSession session=request.getSession();
	      session.setAttribute("risk",service.getRisk(r_no));
	      
	      System.out.println("r_no:"+r_no);
	      d.addAttribute("risk",service.getRisk(r_no));
	      return "a03_project//a06_riskDetail";
	     // return "a06_project/a06_riskDetail";
	   }
	   
	   //http://localhost:7080/zenkit/zenkit.do?method=update
	   @RequestMapping(params="method=update")
	   public String updateRisk(Risk upt) {
		  
		   service.updateRisk(upt);
		   
		   return "forward:/zenkit.do?method=detail";
	   }
	
	   //http://localhost:7080/zenkit/zenkit.do?method=delete
	   @RequestMapping(params = "method=delete") 
	   public String deleteRisk(@RequestParam("r_no") int r_no) {
		  System.out.println("삭제 처리합니다.");
		   service.deleteRisk(r_no);
		 // return "a06_project/a06_riskDetail";
		  return "a03_project/a06_riskDetail";
	   } 
	 }