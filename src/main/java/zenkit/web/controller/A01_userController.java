package zenkit.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import zenkit.web.dto.UserSch;
import zenkit.web.service.A01_userService;
import zenkit.web.service.A01_utilService;
import zenkit.web.vo.Department;
import zenkit.web.vo.Position;
import zenkit.web.vo.Rank;
import zenkit.web.vo.User;

@Controller
@RequestMapping("user.do")
public class A01_userController {
	
	@Autowired(required = false)
	A01_utilService utilService;
	
	@Autowired(required = false)
	A01_userService userService;
	
	// http://localhost:7080/zenkit/user.do?method=form
	@RequestMapping(params = "method=form")
	public String userForm() {
		return "/a01_admin/a02_user_management";
	}
	// http://localhost:7080/zenkit/user.do?method=delete
	@RequestMapping(params = "method=delete")
	public String userDelete(UserSch user) {
		userService.userDelete(user.getU_id());
		return "redirect:/user.do?method=form";
	}
	// http://localhost:7080/zenkit/user.do?method=update
	@RequestMapping(params = "method=update")
	public String userUpdate(UserSch user) {
		userService.userUpdate(user);
		return "redirect:/user.do?method=form";
	}
	// http://localhost:7080/zenkit/user.do?method=insert
	@RequestMapping(params = "method=insert")
	public String userInsert(User user) throws MessagingException {
		String pass = tempPass(10);
		// 현재 u_no + 1
		int u_no = (userService.getU_no()+1);
		String id = tempId(u_no);
		
		// u_no, id, pass 설정
		user.setU_no(u_no);
		user.setU_id(id);
		user.setU_pass(pass);
		
		userService.sendMail(user);
		userService.userInsert(user);
		return "redirect:/user.do?method=form";
	}
	// http://localhost:7080/zenkit/user.do?method=data
	@RequestMapping(params = "method=data")
	public String userList(Model d, UserSch user) {
		if(user.getD_name().equals("부서"))
			user.setD_name("");
		if(user.getPos_name().equals("직책"))
			user.setPos_name("");
		if(user.getR_name().equals("직급"))
			user.setR_name("");
		
		d.addAttribute("userList", userService.getUserList(user));
		return "pageJsonReport";
	}
	
	// http://localhost:7080/zenkit/user.do?method=model
	@RequestMapping(params = "method=model")
	public String modelList(Model d) {
		return "pageJsonReport";
	}
	
	@ModelAttribute("deptList")
	public ArrayList<Department> getDepts(){
		return utilService.getDeptList();
	}
	@ModelAttribute("posList")
	public ArrayList<Position> getPositions(){
		return utilService.getPosList();
	}
	@ModelAttribute("rankList")
	public ArrayList<Rank> getRanks(){
		return utilService.getRankList();
		
	}
	public String tempPass(int size) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
			for (int i = 0; i < size; i++)
				buffer.append(chars[random.nextInt(chars.length)]);
			
		return buffer.toString();
	}
	public String tempId(int u_no) {
		Date date = new Date();
		SimpleDateFormat sDate = new SimpleDateFormat("YYMMdd");
		String id = sDate.format(date);
		id += "-"+(u_no+1);
		
		return id;
	}
}
