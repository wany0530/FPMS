package zenkit.web.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A03_JobDao;
import zenkit.web.dao.A03_projectDao;
import zenkit.web.dto.AddResource;
import zenkit.web.dto.JobStateCnt;
import zenkit.web.dto.MyRisk;
import zenkit.web.dto.ResourceName;
import zenkit.web.dto.RiskStateCnt;
import zenkit.web.dto.SchProject;
import zenkit.web.dto.UpProject;
import zenkit.web.vo.Gantt;
import zenkit.web.vo.Job;
import zenkit.web.vo.Job2;
import zenkit.web.vo.Project;
import zenkit.web.vo.Risk;

@Service
public class A03_projectService {
	
	@Autowired
	A03_projectDao dao;
	
	@Autowired
	A03_JobService jobDao;
	
	
	// 회원별 프로젝트 리스트
	public ArrayList<UpProject> getProList(SchProject sch){
		ArrayList<UpProject> pros = dao.getProList(sch);
		ArrayList<UpProject> riskCnt = dao.getProRiskCnt(sch.getU_no());
		ArrayList<UpProject> outCnt = dao.getProOutCnt(sch.getU_no());
		
		for(UpProject p : pros) {
			
			// VIEW단에서 보여질 날짜포맷으로 변경
			SimpleDateFormat sDate = new SimpleDateFormat("YYYY. MM. dd");
			String startD = sDate.format(p.getP_startD());
			String endD = sDate.format(p.getP_endD());
			
			p.setP_startD_s(startD);
			p.setP_endD_s(endD);
			
			// 리스크 갯수 맵핑
			for(UpProject rc : riskCnt) {
				if(p.getP_no() == rc.getP_no())
					p.setRiskCnt(rc.getRiskCnt());
			}
			// 산출물 갯수 맵핑
			for(UpProject oc : outCnt) {
				if(p.getP_no() == oc.getP_no())
					p.setOutputCnt(oc.getOutputCnt());
			}
		}
		
		
		return pros;
	}
	// 회원별 프로젝트 리스트 카운트
	public int getProListCnt(SchProject sch) {
		return dao.getProListCnt(sch);
	}

	
	
	// 프로젝트 등록
	public void projectReg(Project pro) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("YYYY-MM-dd");
		
		
		
		// Date타입 => String타입 (패턴으로 변경)
		pro.setP_startD_s(dateFormat.format(pro.getP_startD()));
		pro.setP_endD_s(dateFormat.format(pro.getP_endD()));
		
		
		// 첫번째 작업 등록
		UpProject upro = new UpProject();
		upro.setP_name(pro.getP_name());
		upro.setP_startD_s(dateFormat2.format(pro.getP_startD()));
		upro.setP_endD_s(dateFormat2.format(pro.getP_endD()));
		
		
		
		// 프로젝트 설명 없을 때 처리
		if(pro.getP_content().equals("") || pro.getP_content() == null)
			pro.setP_content("설명없음");
		
		pro.setP_endD(pro.getP_startD());
		
		// 프로젝트 등록
		dao.projectReg(pro);
		
		// 리소스 테이블에 등록
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		int p_no = dao.get_LastPno();
		int u_no = dao.get_u_no(pro.getP_pm());
		
		hm.put("p_no", p_no);
		hm.put("u_no", u_no);
		dao.projectInvite(hm);
		
		/* 첫번째 작업 등록 */
		upro.setP_no(p_no);
		upro.setU_no(u_no);
		dao.firstJobInsert(upro);
		
	}   
	

	// 프로젝트 기본정보
	public Project getProjectInfo(int p_no) {
		Project pro = dao.getProInfo(p_no);
		
		// 날짜 포맷 변경
		SimpleDateFormat dfmt = new SimpleDateFormat("YYYY-MM-dd");
		String startD = dfmt.format(pro.getP_startD());
		String endD = dfmt.format(pro.getP_endD());
		pro.setP_startD_s(startD);
		pro.setP_endD_s(endD);
				
		return pro;
	}
	
	// 프로젝트 PM이름
	public String getPM(int p_no) {
		return dao.getPM(p_no);
	}
	
	// 개인이 조치해야할 리스크 목록
	public ArrayList<Risk> getMyRisk(MyRisk myRisk){
		return dao.getMyRisk(myRisk);
	}
	
	// 프로젝트 참여시키기
	public void addResource(AddResource resource) {
		dao.addUser(resource);
	}
	// 프로젝트 제외시키기
	public void delResource(AddResource resource) {
		dao.delUser(resource);
	}
	
	// 프로젝트 참여인원
	public ArrayList<ResourceName> getProjectResource(int p_no){
		return dao.getResource(p_no);
	}
	
	// 참여 가능한 부서별 전체인원
	public ArrayList<ResourceName> getDeptResource(int d_no, int p_no){
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		
		hm.put("d_no", d_no);
		hm.put("p_no", p_no);
		
		return dao.getDeptResource(hm);
	}
	
	// 회원의 해당프로젝트의 작업 건 가져오기
	public ArrayList<Job2> getJobList(int p_no, int u_no){
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		
		hm.put("p_no", p_no);
		hm.put("u_no", u_no);
		
		return dao.getJobList(hm);
	}
	
	// 개인 작업 리스트 간트형식으로 변경
	public ArrayList<Gantt> getJobListJson(int p_no, int u_no){
		
		// 객체 생성 (해시맵, 간트, 데이트포맷)
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		ArrayList<Gantt> gantt = new ArrayList<Gantt>();
		SimpleDateFormat sDate = new SimpleDateFormat("dd-MM-YYYY");
		
		hm.put("p_no", p_no);
		hm.put("u_no", u_no);
		
		// 작업 리스트 가져오기
		ArrayList<Job2> jobs =  dao.getJobList(hm);
		
		for (Job2 j : jobs) {
			String startD = sDate.format(j.getJ_startD());
			String endD = sDate.format(j.getJ_endD());

			Gantt g = new Gantt();
			g.setId(j.getJ_no());
			g.setParent(0);
			g.setText(j.getJ_name());
			g.setCharger(j.getJ_charger());
			g.setStart_date(startD);
			g.setEnd_date(endD);
			g.setProgress(j.getJ_completeR());
			gantt.add(g);
			
		}
		
		return gantt;
	}
	// 총 진행률 가져오기
	public double getTotProgress(int p_no) {
		
		int parentCnt = 0; // 최상위 작업 카운트
		double parentProgress = 0; // 최상위 작업 진행률
		double totProgress = 0; // 진행률
		ArrayList<Job> jobs = jobDao.jobList3(p_no);
		
		for(Job j : jobs) {
			// 최상위 작업일때,
			if(j.getJ_refno() == 0) {
				parentProgress += (j.getJ_completeR() * 100);
				parentCnt++;
			}
		}
		// 총 진행률 계산
		totProgress = parentProgress / parentCnt;
		
		return totProgress;
	}
	
	
	// 프로젝트 작업 상태 가져오기 (카운트 값)
	public JobStateCnt getJobState(int p_no) {
		return dao.getJobState(p_no);
	}
	
	// 프로젝트 리스크 상태 가져오기 (카운트 값)
	public RiskStateCnt getRiskState(int p_no) {
		return dao.getRiskState(p_no);
	}
	
	// 특정 회원의 프로젝트 참여 건수
	public int getJobCnt(int p_no, int u_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("p_no", p_no);
		hm.put("u_no", u_no);
		
		return dao.getJobCnt(hm);
	}
	
	// 작업의 담당자가 없어질 경우, 담당자 PM으로 변경
	public void updateManager(int p_no, int u_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("p_no", p_no);
		hm.put("u_no", u_no);
		
		dao.updateManager(hm);
	}
}
