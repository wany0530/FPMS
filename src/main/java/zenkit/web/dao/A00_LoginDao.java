package zenkit.web.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.User;
import zenkit.web.vo.UserInfoDetail;

@Repository
public interface A00_LoginDao {
	// 로그인
	public UserInfoDetail login(User mem); 
	// 회원정보 변경
	public void updateUserInfo(User mem);
	// 유저 정보 가져오기
	public User getUserInfo(User user);
	// 패스워드 변경
	public void updatePwd(User user);
	
	// 테이블 존재 유무
	public int tableExist(String t_name);
	// 시퀀스 존재 유무
	public int sequenceExist(String seq_name);
	
	// 직급 테이블 생성
	public void createRank();
	// 직급 시퀀스 생성
	public void createRankSeq();
	// 직급 추가
	public void addRank(String rank_name);
	
	// 직책 테이블 생성
	public void createPosition();
	// 직책 시퀀스 생성
	public void createPositionSeq();
	// 직책 추가
	public void addPosition(String pos_name);
	
	// 부서 테이블 생성
	public void createDept();
	// 부서 시퀀스 생성
	public void createDeptSeq();
	// 부서 추가
	public void addDept(String dept_name);
	
	// 임직원 테이블 생성
	public void createUser();
	// 임직원 추가
	public void addUser(User user);
	
	// 일정 테이블 생성
	public void createCal();
	// 일정 시퀀스 생성
	public void createCalSeq();
	
	// 프로젝트 테이블 생성
	public void createProject();
	// 프로젝트 시퀀스 생성
	public void createProjectSeq();
	
	// 리소스 테이블 생성
	public void createResource();
	
	// 작업 테이블 생성
	public void createJob();
	// 프로젝트 시퀀스 생성
	public void createJobSeq();
	
	// 결재상태 테이블 생성
	public void createAuthState();
	// 결재상태 추가
	public void addAuthState(String state_name);
	
	// 결재 테이블 생성
	public void createAuth();
	// 프로젝트 시퀀스 생성
	public void createAuthSeq();
	
	// 결재상태 테이블 생성
	public void createRiskState();
	// 결재상태 추가
	public void addRiskState(String state_name);
	
	// 리스크 테이블 생성
	public void createRisk();
	// 리스크 시퀀스 생성
	public void createRiskSeq();
	
	// 조치이력 테이블 생성
	public void createRiskAction();

	// 산출물 테이블 생성
	public void createOutput();
	// 산출물 시퀀스 생성
	public void createOutputSeq();
	
	// 테이블 삭제
	public void deleteTable(String table_name);
	// 시퀀스 삭제
	public void deleteSequence(String seq_name);
	
	
}