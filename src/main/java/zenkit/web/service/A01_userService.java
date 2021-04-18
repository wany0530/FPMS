package zenkit.web.service;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_userDao;
import zenkit.web.dto.UserSch;
import zenkit.web.vo.User;

@Service
public class A01_userService {
	
	@Autowired(required = false)
	A01_userDao dao;
	
	@Autowired(required = false)
	private JavaMailSender sender;
	
	
	public ArrayList<UserSch> getUserList(UserSch user){
		return dao.userList(user);
	}
	public void userDelete(String id) {
		dao.userDelete(id);
	}
	public void userUpdate(UserSch user) {
		dao.userUpdate(user);
	}
	public int getU_no() {
		return dao.getU_no();
	}
	public void userInsert(User user) {
		dao.userInsert(user);
	}
	
	public void sendMail(User user) throws MessagingException {
		
		MimeMessage msg = sender.createMimeMessage();
		String content;
		
		// 2. 제목 설정.
		msg.setSubject("[zenkit]에 가입이 완료되었습니다.");
		
		// 3. 수신자 설정.
		msg.setRecipient(RecipientType.TO,
				new InternetAddress(user.getU_email()));
		
		// 4. 내용 설정.
		content = "임시 비밀번호가 발급되었습니다.\n";
		content += "\n";
		content += "사번:"+user.getU_id()+"\n";
		content += "임시 비밀번호:"+user.getU_pass();
		msg.setText(content);
		
		// 5. 발송 처리.
		sender.send(msg);
		
	}
}
