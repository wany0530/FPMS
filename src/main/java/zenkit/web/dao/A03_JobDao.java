package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.JobSch;
import zenkit.web.vo.Job;
import zenkit.web.vo.Job2;
import zenkit.web.vo.Project;

@Repository
public interface A03_JobDao {
	// Gantt에 표시할 내용.2
	public ArrayList<Job> jobList2(JobSch sch);
	
	// 특정 작업 총 갯수2
	public int totcount(JobSch sch);

	// Gantt에 표시할 내용.
	public ArrayList<Job> jobList(int p_no);
	public ArrayList<Job2> jobList3(int p_no);
	
	// 상위 작업명 데이터 조회
	public Job parentjob(int j_no);
	
	// 특정 작업 총 갯수
	public int jobcount(int p_no);
	
	// 프로젝트 데이터 조회
	public Project projectGet(int p_no);
	
	// 특정 프로젝트 참여 인원 데이터 조회
	public ArrayList<Job> jobPeople(int p_no);
	
	// 작업 등록 메소드
	public void jobInsert(Job ins);
	
	// 특정 작업 데이터 조회 
	public Job jobDetail(int j_no);
	
	// 특정 작업 데이터 업데이트 
	public void jobUpdate(Job upt);
	
	// 특정 작업 삭제
	public void jobDelete(int j_no);
	
	// 특정 작업 완료율 수정시 -> 상위 작업 완료율 업데이트
	public void TopjobcomR(int j_refno);
}
