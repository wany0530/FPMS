package zenkit.web.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import zenkit.web.dto.UpRisk;
import zenkit.web.service.A03_riskService;
import zenkit.web.vo.Project;
import zenkit.web.vo.ResponseStrategies;
import zenkit.web.vo.Risk;
import zenkit.web.vo.RiskAction;

import zenkit.web.vo.User;


@Controller
public class A03_riskController {
	
	
	@Autowired(required = false)
	private A03_riskService service;
	//http://localhost:7080/zenkit/zenkit.do?method=riskList
	@RequestMapping(params="method=riskList")
	public String riskList( HttpServletRequest request, @ModelAttribute("sch") UpRisk sch, Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		sch.setU_no(user.getU_no());
		
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
	      service.riskInsert(insert);     
	      d.addAttribute("proc","riskInsert");   
	      return "a03_project//a06_riskInsert";
	  //     return "a06_project/a06_riskDetail";
	     
	   }
	   
	   //조치내용 인서트
	 //  public void riskActionInsert(RiskAction insert) {
		//	dao.riskActionInsert(insert);
	   //?ac_receive=02MA064&ac_name=servertest&ac_state=진행&r_no=1

	   //http://localhost:7080/zenkit/zenkit.do?method=riskActionInsert&ac_receive=02MA064&ac_name=servertest&ac_state=진행&r_no=1
	   @RequestMapping(params="method=riskActionInsert")
	   public String riskActionInsert(RiskAction insert, Model d) {
		   service.riskActionInsert(insert);
		   Risk upt=new Risk();
		   upt.setR_no(insert.getR_no());
		   upt.setRs_name(insert.getAc_state());
		   service.uptRiskState(upt);
		   return "pageJsonReport";
	   }
	   
	   /*혜지언니의 소중한 소스
	       *    @ModelAttribute("pmPros")
public ArrayList<String> getPmPros(@SessionAttribute("sesMem") User user) {
   return service.getPmPros(user.getU_no());
}*/
	   
       @ModelAttribute("risks")//화면의 select option으로 리스트 데이터  public ArrayList <Project> getProjects(int u_no);
       public ArrayList <Project> getProjects(@SessionAttribute("sesMem") User user ){
    	   
    	   return service.getProjects(user.getU_no());
       }
	
	   //http://localhost:7080/zenkit/zenkit.do?method=detail
	   @RequestMapping(params="method=detail")
	   public String riskDetail(@RequestParam  int r_no, Model d, HttpServletRequest request){
	      HttpSession session=request.getSession();
	      session.setAttribute("risk",service.getRisk(r_no));      
	      System.out.println("r_no:"+r_no);
	      d.addAttribute("risk",service.getRisk(r_no));
	      //동일한 r_no에 대한 조치내용 리스트 가져오기
	      d.addAttribute("riskactionList",service.getactionList(r_no));
	      //리스크 디테일 이름 가져오기
	      d.addAttribute("pmNumber", service.getPMNumber(r_no));	           
	      //상세 페이지에서 p_no로 프로젝트 인원 수 구하기 public ArrayList<User> getUsers(int p_no){
	  	//return dao.getUsers(p_no);    
	      d.addAttribute("getUsers", service.getUsers(service.getRisk(r_no).getP_no()));
	   
	      //r_no로 리스크 정보를 가져올 수 있다. getRiskmapper 여기에 플젝 번호가 들어감
	      //addAttribute -> getUsers를 저장한 것.
	      //getRisk(r_no)로 연결하여 거기에 있는 getP_no()로 리스크 정보를 가져온 것 넵!!!
	      return "a03_project//a06_riskDetail";
	     // return "a06_project/a06_riskDetail";
	   }
	   
	   
       @ModelAttribute("resStrategies")
       public ResponseStrategies[] getResponseStrategies() {
          return ResponseStrategies.values();
       }
       
	   //http://localhost:7080/zenkit/zenkit.do?method=update
	   @RequestMapping(params= "method=update")
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
	   
	   
	   
	   //
	 }