package zenkit.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import zenkit.web.dto.OutputSch;
import zenkit.web.dto.UpOutput;
import zenkit.web.service.A02_OutputService;
import zenkit.web.vo.User;


@Controller
@RequestMapping("output.do")
public class A02_OutputController {
	
	@Autowired(required=false)
	private A02_OutputService service;
	
	// http://localhost:7080/zenkit/output.do?method=outputs
	@GetMapping(params="method=outputs")
	public String outputList(HttpServletRequest request, OutputSch sch, Model m) {
		
		// 유저 정보 세션값 받기
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		OutputSch outputSch = new OutputSch();
		outputSch.setU_no(user.getU_no());
		
		// 해당 유저의 산출물 리스트
		m.addAttribute("outputList", service.getOutput(outputSch));
		
		return "a02_myTask/a02_outputs";
	}
	@PostMapping(params="method=reg")
	public String regOutput(MultipartFile o_file, UpOutput output, Model m) {
		
		System.out.println("name="+o_file.getOriginalFilename());
		System.out.println("size="+o_file.getSize());
		// 산출물 등록
		service.regOutput(output, o_file);
		return "redirect:/output.do?method=outputs";
	}
	
	@GetMapping(params="method=del")
	public String delOutput(UpOutput output, Model m) {
		// 산출물 삭제
		service.delOutput(output);
		m.addAttribute("isDelete","Y");
		return "redirect:/output.do?method=outputs";
	}
	
	@GetMapping(params="method=down")
	public String download(@RequestParam("fname") String fname, Model d) {
		
		d.addAttribute("downloadFile", fname);
		return "downloadviewer";
	}
	
}
