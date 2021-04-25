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
		
		sch.setU_no(user.getU_no());
		
		if(sch.getCurrPage() == 0) {
			sch.setCurrPage(1);
		}
		int size = 3;
		int page = sch.getCurrPage();
		int startNum = 1 + (page-1) * size;
		int endNum = page * size;
		int startPage = page -(page-1)%5;
		int cnt = service.getUserOutCnt(sch);
		int lastPage = ((cnt%size) == 0)? (cnt/size) : (cnt/size)+1;
		int endPage = ((startPage+4 < lastPage)?startPage+4:lastPage);

		sch.setCount(cnt);
		sch.setLastPage(lastPage);
		sch.setStartNum(startNum);
		sch.setEndNum(endNum);
		sch.setStartPage(startPage);
		sch.setEndPage(endPage);
		
		// 해당 유저 프로젝트 리스트
		m.addAttribute("proList", service.getUserProList(user.getU_no()));
		// 해당 유저의 산출물 리스트
		m.addAttribute("outputList", service.getOutput(sch));
		// 검색 객체
		m.addAttribute("sch", sch);
		
		return "a02_myTask/a02_outputs";
	}
	
	// 산출물 등록
	@PostMapping(params="method=reg")
	public String regOutput(MultipartFile o_file, UpOutput output, Model m,
			HttpServletRequest request) {
		
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
