package zenkit.web.service;

import java.util.HashMap;
import java.util.Map;
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
	
	// 테이블 생성
	public void createTable() {
		
		// 직급 테이블 생성
		if(dao.tableExist("Z_RANK") == 0) {
			dao.createRank();
			// 직급 시퀀스 생성
			if(dao.sequenceExist("Z_RANK_NO_SEQ") == 0) {
				dao.createRankSeq();
				
				// 기본 직급 추가
				dao.addRank("CEO");
				dao.addRank("이사");
				dao.addRank("부장");
				dao.addRank("과장");
				dao.addRank("대리");
				dao.addRank("사원");
			}
		}
		
		// 직책 테이블 생성
		if(dao.tableExist("Z_POSITION") == 0) {
			dao.createPosition();
			// 직책 시퀀스 생성
			if(dao.sequenceExist("Z_POSITION_NO_SEQ") == 0) {
				dao.createPositionSeq();
				
				// 기본 직책 추가
				dao.addPosition("CEO");
				dao.addPosition("인사담당자");
				dao.addPosition("PM");
				dao.addPosition("임직원");
			}
		}
		
		// 부서 테이블 생성
		if(dao.tableExist("Z_DEPARTMENT") == 0) {
			dao.createDept();
			// 부서 시퀀스 생성
			if(dao.sequenceExist("Z_DEPARTMENT_NO_SEQ") == 0) {
				dao.createDeptSeq();
				
				// 기본 부서 추가
				dao.addDept("임원진");
				dao.addDept("경영지원팀");
				dao.addDept("인사팀");
				dao.addDept("영업팀");
				dao.addDept("개발 1팀");
				dao.addDept("개발 2팀");
			}
		}
		
		// 임직원 테이블 생성
		if(dao.tableExist("Z_USER") == 0) {
			dao.createUser();
			
			// 기본 임직원 추가
			dao.addUser(new User(1, "ceo", "ceo", "CEO", "", "", "", 1, 1, 1)); // CEO
			dao.addUser(new User(2, "hr", "hr", "김기영", "", "", "", 3, 2, 2)); // 인사담당자
			dao.addUser(new User(3, "pm", "pm", "이나영", "", "", "", 5, 3, 3)); // CEO
			dao.addUser(new User(4, "st1", "st1", "오현석", "", "", "", 5, 4, 5)); // 임직원
			dao.addUser(new User(5, "st2", "st2", "이수현", "", "", "", 5, 4, 6)); // 임직원
		}

		// 일정 테이블 생성
		if(dao.tableExist("Z_CALENDAR") == 0) {
			dao.createCal();
			// 일정 시퀀스 생성
			if(dao.sequenceExist("Z_CALENDAR_NO_SEQ") == 0) {
				dao.createCalSeq();
			}
		}
		
		// 프로젝트 테이블 생성
		if(dao.tableExist("Z_PROJECT") == 0) {
			dao.createProject();
			// 프로젝트 시퀀스 생성
			if(dao.sequenceExist("Z_PROJECT_NO_SEQ") == 0) {
				dao.createProjectSeq();
			}
		}
		
		// 리소스 테이블 생성
		if(dao.tableExist("Z_RESOURCE") == 0) {
			dao.createResource();
		}
		
		// 작업 테이블 생성
		if(dao.tableExist("Z_JOB") == 0) {
			dao.createJob();
			// 작업 시퀀스 생성
			if(dao.sequenceExist("Z_JOB_NO_SEQ") == 0) {
				dao.createJobSeq();
			}
		}
		
		// 결재상태 테이블 생성
		if(dao.tableExist("Z_AUTH_STATE") == 0) {
			dao.createAuthState();
			
			// 결재상태 추가
			dao.addAuthState("승인중");
			dao.addAuthState("승인완료");
			dao.addAuthState("반려");
			dao.addAuthState("회수");
			dao.addAuthState("대기");
		}
		
		// 결재 테이블 생성
		if(dao.tableExist("Z_AUTH") == 0) {
			dao.createAuth();
			// 결재 시퀀스 생성
			if(dao.sequenceExist("Z_AUTH_NO_SEQ") == 0) {
				dao.createAuthSeq();
			}
		}
		
		// 리스크상태 테이블 생성
		if(dao.tableExist("Z_RISK_STATE") == 0) {
			dao.createRiskState();
			
			// 결재상태 추가
			dao.addRiskState("오픈");
			dao.addRiskState("조치완료");
			dao.addRiskState("진행");
			dao.addRiskState("취소");
			dao.addRiskState("홀드");
		}
		
		// 리스크 테이블 생성
		if(dao.tableExist("Z_RISK") == 0) {
			dao.createRisk();
			// 리스크 시퀀스 생성
			if(dao.sequenceExist("Z_RISK_NO_SEQ") == 0) {
				dao.createRiskSeq();
			}
		}
		
		// 조치이력 테이블 생성
		if(dao.tableExist("Z_RISK_ACTION") == 0)
			dao.createRiskAction();
		
		// 산출물 테이블 생성
		if(dao.tableExist("Z_OUTPUTS") == 0) {
			dao.createOutput();
			// 리스크 시퀀스 생성
			if(dao.sequenceExist("Z_OUTPUTS_NO_SEQ") == 0) {
				dao.createOutputSeq();
			}
		}		
	}
	
	public void adllClear() {
		// 테이블 전체 삭제
		System.out.println("asdfasdfadsfsd");
		dao.deleteTable("Z_OUTPUTS");
//		dao.deleteTable("Z_RISK_ACTION");
//		dao.deleteTable("Z_RISK");
//		dao.deleteTable("Z_RISK_STATE");
//		dao.deleteTable("Z_AUTH");
//		dao.deleteTable("Z_AUTH_STATE");
//		dao.deleteTable("Z_JOB");
//		dao.deleteTable("Z_RESOURCE");
//		dao.deleteTable("Z_PROJECT");
//		dao.deleteTable("Z_CALENDAR");
//		dao.deleteTable("Z_USER");
//		dao.deleteTable("Z_DEPARTMENT");
//		dao.deleteTable("Z_POSITION");
//		dao.deleteTable("Z_RANK");
//		
//		// 시퀀스 전체 삭제
//		dao.deleteSequence("Z_OUTPUTS_NO_SEQ");
//		dao.deleteSequence("Z_RISK_NO_SEQ");
//		dao.deleteSequence("Z_AUTH_NO_SEQ");
//		dao.deleteSequence("Z_JOB_NO_SEQ");
//		dao.deleteSequence("Z_PROJECT_NO_SEQ");
//		dao.deleteSequence("Z_CALENDAR_NO_SEQ");
//		dao.deleteSequence("Z_DEPARTMENT_NO_SEQ");
//		dao.deleteSequence("Z_POSITION_NO_SEQ");
//		dao.deleteSequence("Z_RANK_NO_SEQ");
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
	
	// 패스워드 변경
	public void updatePwd(User user) {
		dao.updatePwd(user);
	}
	
}