package zenkit.web.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A00_LoginDao;
import zenkit.web.vo.User;
import zenkit.web.vo.UserInfoDetail;

@Service
public class A00_loginService {

	@Autowired(required=false)
	A00_LoginDao dao;
	
	@Autowired(required = false)
	private JavaMailSender sender;
	
	// 로그인
	public UserInfoDetail login(User mem) {
		return dao.login(mem);
	}
	
	// 유저 정보 업데이트
	public void updateUserInfo(User mem) {
		System.out.println("LOG : 업데이트 정보");
		System.out.printf("u_id = %s, u_email = %s, u_phone = %s, u_img = %s",
				mem.getU_id(), mem.getU_email(), mem.getU_phone(), mem.getU_img());
		dao.updateUserInfo(mem);
	}
	
	// 유저 정보 확인(id, email을 통해)
	public User getUserInfo(User user) {
		return dao.getUserInfo(user);
	}
	
	// 임시비밀번호 전송
	public void sendMail(User user) throws MessagingException {
		
		MimeMessage msg = sender.createMimeMessage();
		String content;
		
		// 2. 제목 설정.
		msg.setSubject("임시 비밀번호가 발급되었습니다.");
		
		// 3. 수신자 설정.
		msg.setRecipient(RecipientType.TO,
				new InternetAddress(user.getU_email()));
		
		// 4. 내용 설정.
		String pwd = tempPass(10);
		content = "임시 비밀번호가 발급되었습니다.\n";
		content += "\n";
		content += "임시 비밀번호:"+pwd;
		msg.setText(content);
		
		// 5. 유저 패스워드 변경
		user.setU_pass(pwd);
		dao.updatePwd(user);
		
		// 6. 발송 처리.
		sender.send(msg);
	}
	
	// 임시 비밀번호 생성
	public String tempPass(int size) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
			for (int i = 0; i < size; i++)
				buffer.append(chars[random.nextInt(chars.length)]);
			
		return buffer.toString();
	}
}