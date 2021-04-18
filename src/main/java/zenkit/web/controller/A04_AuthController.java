package zenkit.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import zenkit.web.dto.AuthSch;
import zenkit.web.service.A04_AuthService;
import zenkit.web.vo.AuthInfo;
import zenkit.web.vo.Job;
import zenkit.web.vo.User;

@Controller
public class A04_AuthController {
	
	@Autowired(required = false)
	private A04_AuthService service;
	
	// http://localhost:7080/zenkit/authIng.do
	@RequestMapping("authIng.do")
	public String authIngList(@ModelAttribute("sch") AuthSch sch, @SessionAttribute("sesMem") User user, Model d) {
		sch.setRes_no(user.getU_no());
		sch.setA_name("승인중");
		d.addAttribute("authList", service.authListPm(sch));
		
		return "a04_auth\\authIng";
	}
	
	// http://localhost:7080/zenkit/authApp.do
	@RequestMapping("authApp.do")
	public String authAppList(@ModelAttribute("sch") AuthSch sch, @SessionAttribute("sesMem") User user, Model d) {
		sch.setRes_no(user.getU_no());
		sch.setA_name("승인완료");
		d.addAttribute("authList", service.authListPm(sch));
		
		return "a04_auth\\authAppReject";
	}
	
	// http://localhost:7080/zenkit/authRej.do
	@RequestMapping("authRej.do")
	public String authRejList(@ModelAttribute("sch") AuthSch sch, @SessionAttribute("sesMem") User user, Model d) {
		sch.setRes_no(user.getU_no());
		sch.setA_name("반려");
		d.addAttribute("authList", service.authListPm(sch));
		
		return "a04_auth\\authAppReject";
	}
	
	// http://localhost:7080/zenkit/authReq.do
	@GetMapping("authReq.do")
	public String authReqList(@ModelAttribute("sch") AuthSch sch, @SessionAttribute("sesMem") User user, Model d) {
		sch.setReq_no(user.getU_no());
		if(sch.getA_name()==null) {
			sch.setA_name("");
		}	
		d.addAttribute("authList", service.authList(sch));
		
		return "a04_auth\\authReq";
	}
	
	@PostMapping("authReq.do")
	public String authReqList2(@ModelAttribute("sch") AuthSch sch, @SessionAttribute("sesMem") User user, Model d) {
		sch.setReq_no(user.getU_no());
		d.addAttribute("authList", service.authList(sch));
		return "a04_auth\\authReq";
	}
	
	// http://localhost:7080/zenkit/jsonModal.do?j_no=1&a_no=1
	@RequestMapping("jsonModal.do")
	public String ajaxModal(@RequestParam(value="j_no") int j_no,
					@RequestParam(value="a_no") int a_no, Model d) {
		d.addAttribute("jobInfo", service.getJobInfo(j_no));
		AuthInfo auth = service.getAuthInfo(a_no);
		if(auth.getA_requestN()!=null) {
			auth.setA_requestN(auth.getA_requestN().replace("\n", "<br>"));
		}
		System.out.println(auth.getA_requestN());
		if(auth.getA_resultN()!=null) {
			auth.setA_resultN(auth.getA_resultN().replace("\n", "<br>"));
		}
		d.addAttribute("authInfo", auth);
		d.addAttribute("outputs", service.getOutputInfo(j_no));
		return "pageJsonReport";
	}
	
	@ModelAttribute("pmPros")
	public ArrayList<String> getPmPros(@SessionAttribute("sesMem") User user) {
		return service.getPmPros(user.getU_no());
	}
	
	@ModelAttribute("pros")
	public ArrayList<String> getPros(@SessionAttribute("sesMem") User user) {
		return service.getPros(user.getU_no());
	}
	
	// http://localhost:7080/zenkit/retire.do?a_no=1
	@RequestMapping("retire.do")
	public String retire(@RequestParam(value="a_no") int a_no) {
		service.chRetire(a_no);
		return "forward:authReq.do";
	}
	
	// http://localhost:7080/zenkit/apprej.do?a_no=12&a_resultN="승인합니다"&a_name="승인완료"
	@RequestMapping("apprej.do")
	public String approve(AuthInfo upt) {
		System.out.println("AuthInfo : " + upt.getA_resultN());
		service.chAppRej(upt);
		if(upt.getA_name().equals("승인완료")) {
			Job chJob = new Job();
			chJob.setJ_no(upt.getJ_no());
			chJob.setJ_completeR((double)upt.getA_requestP()/100);
			service.chJobComple(chJob);
		}
		return "pageJsonReport";
	}
}
