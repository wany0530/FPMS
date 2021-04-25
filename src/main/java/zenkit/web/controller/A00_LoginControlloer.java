package zenkit.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.LocaleResolver;

import zenkit.web.service.A00_loginService;
import zenkit.web.vo.User;
import zenkit.web.vo.UserInfoDetail;

@Controller
public class A00_LoginControlloer {
	
	@Autowired(required = false)
	private A00_loginService service;
	
	@Autowired(required = false)
	private ServletContext ctx;

	// 업로드 경로
	@Value("${upload}")
	String uploadPath;
	
	// 다국어 처리
	@Autowired(required = false)
	private LocaleResolver localResovler;
	
	// http://localhost:7080/zenkit/zenkit.do?method=login
	@GetMapping(params = "method=login")
	public String login() {
		service.createTable();
		return "a00_login//a01_login";
	}

	@PostMapping(params = "method=login")
	public String login(User mem, HttpServletRequest request) {
		System.out.println("아이디:" + mem.getU_id());

		User ckDB = service.login(mem);
		if (ckDB != null) {// 해당 값이 있으면
			HttpSession session = request.getSession();

			session.setAttribute("sesMem", ckDB);
			request.setAttribute("loginSucc", "Y");
		} else {
			request.setAttribute("loginSucc", "N");
		}
		return "a00_login//a01_login";
	}

	@RequestMapping(params = "method=logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/dashboard.do?method=personalList";
	}
	
	//http://localhost:7080/zenkit/profile.do
	@GetMapping("profile.do")
	public String profile() {
		return "a00_login//a02_user";
	}
	
	@PostMapping("profile.do")
	public String profile(MultipartFile u_img, HttpServletRequest request) throws IllegalStateException, IOException {
		
		// 업데이트할 회원 정보 (
		String u_id = request.getParameter("u_id");
		String u_email = request.getParameter("u_email");
		String u_phone = request.getParameter("u_phone");
		String currImg = request.getParameter("currImg");
		String filename = u_img.getOriginalFilename(); // 파일 이름
		
		// 데이터베이스 업데이트 (이메일, 핸드폰)
		User mem = new User();
		mem.setU_id(u_id);
		mem.setU_email(u_email);
		mem.setU_phone(u_phone);
		
		// 유저 세션값 업데이트
		HttpSession session = request.getSession();
		UserInfoDetail sesMem = (UserInfoDetail)session.getAttribute("sesMem");
		sesMem.setU_email(u_email);
		sesMem.setU_phone(u_phone);
		
		// 파일 경로 생성(웹경로, 실제경로)
		String upPath = uploadPath + File.separator + "profile" + File.separator + u_id;
		String dbPath = "z03_upload"+File.separator+"profile"+File.separator+u_id+File.separator+filename;
		
		// 수정할 파일이 있을 시
		if(filename != null && !filename.equals("")) {
			
			File realSavePath = new File(upPath); // 물리적 경로
			
			// 업로드하기 위한 경로가 없을 경우 디렉토리 생성
			if(!realSavePath.exists())
				realSavePath.mkdirs();
			
			// 경로에 해당파일 저장
			upPath += File.separator + filename;
			File saveFile = new File(upPath); 
			u_img.transferTo(saveFile);
			System.out.println("LOG : 프로필 이미지 저장완료");
			
			// 데이터베이스 업데이트(프로필이미지)
			mem.setU_img(dbPath);
			
			// 유저 세션값 업데이트
			sesMem.setU_img(dbPath);
		} else {
			mem.setU_img(currImg);
			sesMem.setU_img(currImg);
		}
		
		service.updateUserInfo(mem);
		return "redirect:/profile.do";
	}
	
	// 다국어 처리
	@RequestMapping("choiceLan.do")
	public String choiceLan(@RequestParam("lang") String lang,
				HttpServletRequest request,
				HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		Locale locale = new Locale(lang);
		localResovler.setLocale(request, response, locale);
		
		return "a00_login//a01_login";
	}
	// 다국어 처리
	@RequestMapping("choiceLan1.do")
	public String choiceLan1(@RequestParam("lang") String lang,
			HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		Locale locale = new Locale(lang);
		localResovler.setLocale(request, response, locale);
		
		return "a00_login//a01_findPwd";
	}
	
	// 비밀번호 찾기
	@GetMapping("findPwd.do")
	public String findPwdForm() {
		return "a00_login/a01_findPwd";
	}
	
	// 유저 찾기
	@PostMapping("findPwd.do")
	public String findPwd(User user, Model m) throws MessagingException {
		User userInfo = service.getUserInfo(user);
		if(userInfo == null) {
			m.addAttribute("userInfo", "N");
		} else {
			service.sendMail(userInfo);
			m.addAttribute("userInfo", "Y");
		}
		return "a00_login/a01_findPwd";
	}
	
	// 비밀번호 확인 폼
	@RequestMapping("changePwd.do")
	public String changePwdForm() {
		
		return "a00_login/a03_changePwd";
	}
	// 비밀번호 성공 했을 때 나타나는 폼
	@GetMapping("pwdSuccForm.do")
	public String pwdSuccForm() {
		
		return "a00_login/a04_pwdSuccess";
	}
	// 비밀번호 성공 했을 때 나타나는 폼
	@PostMapping("pwdSuccForm.do")
	public String pwdSuccForm(@RequestParam("newPwd") String pass, HttpServletRequest request,
		Model m) {
		
		// 유저 세션값 받아오기
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("sesMem");
		
		// 유저 비밀번호 변경
		user.setU_pass(pass);
		service.updatePwd(user);
		
		m.addAttribute("change", "Y");
		
		return "a00_login/a04_pwdSuccess";
	}
	
	// http://localhost:7080/zenkit/allClear.do
	@RequestMapping("allClear.do")
	public void adllClear() {
		service.adllClear();
	}
		
	
}
