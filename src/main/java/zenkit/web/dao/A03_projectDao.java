package zenkit.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.AddResource;
import zenkit.web.dto.JobStateCnt;
import zenkit.web.dto.MyRisk;
import zenkit.web.dto.ResourceName;
import zenkit.web.dto.RiskStateCnt;
import zenkit.web.dto.SchProject;
import zenkit.web.dto.UpProject;
import zenkit.web.vo.Job2;
import zenkit.web.vo.Project;
import zenkit.web.vo.Risk;

@Repository
public interface A03_projectDao {
	// 회원이 참여한 프로젝트 전체 리스트 출력
	public ArrayList<UpProject> getProList(SchProject sch);
	// 회원이 참여한 프로젝트 리스트의 리스크 갯수
	public ArrayList<UpProject> getProRiskCnt(int u_no);
	// 회원이 참여한 프로젝트 리스트의 산출물 갯수
	public ArrayList<UpProject> getProOutCnt(int u_no);
	// 회원이 참여한 프로젝트 전체 리스트 카운트
	public int getProListCnt(SchProject sch);
	// 프로젝트 등록하기
	public void projectReg(Project pro);
	// 마지막 유저 번호 얻기
	public int get_LastPno();
	// 유저 정보 얻기
	public int get_u_no(String p_pm);
	// 프로젝트별 참여인원
	public ArrayList<ResourceName> getResource(int p_no);
	// 프로젝트 정보
	public Project getProInfo(int p_no);
	// 참여 가능한 부서별 전체인원
	public ArrayList<ResourceName> getDeptResource(HashMap<String, Integer> member);
	// 리소스 관리 (프로젝트 참여 : 번호로)
	public void projectInvite(HashMap<String, Integer> hm);
	// 리소스 관리 (프로젝트 참여 : 이름으로)
	public void addUser(AddResource adduser);
	// 리소스 관리 (프로젝트 참여 제외)
	public void delUser(AddResource deluser);
	// 프로젝트 PM이름
	public String getPM(int p_no); 
	// 개인이 조치해야할 리스크 목록
	public ArrayList<Risk> getMyRisk(MyRisk myRisk);
	// 회원이 담당하는 프로젝트의 작업 건
	public ArrayList<Job2> getJobList(HashMap<String, Integer> userPro); 
	// 프로젝트별 작업 현황(카운트 값)
	public JobStateCnt getJobState(int p_no); 
	// 프로젝트별 리스크 현황(카운트 값)
	public RiskStateCnt getRiskState(int p_no); 
	// 특정 회원이 참여한 프로젝트의 작업건수
	public int getJobCnt(HashMap<String, Integer> userPro);
	// 작업의 담당자가 없어질 경우, 담당자 PM으로 변경
	public void updateManager(HashMap<String, Integer> userPro);
	public void firstJobInsert(UpProject upro);
}
