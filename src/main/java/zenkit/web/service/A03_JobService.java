package zenkit.web.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A03_JobDao;
import zenkit.web.dto.JobSch;
import zenkit.web.vo.Gantt;
import zenkit.web.vo.Gantt2;
import zenkit.web.vo.Job;
import zenkit.web.vo.Project;

@Service
public class A03_JobService {

	@Autowired(required = false)
	private A03_JobDao dao;

	public ArrayList<Gantt> jobList(int p_no) {
		ArrayList<Gantt> gantt = new ArrayList<Gantt>();
		ArrayList<Job> jobs = dao.jobList(p_no);
		for (Job j : jobs) {

			SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
			String startD = sDate.format(j.getJ_startD());
			String endD = sDate.format(j.getJ_endD());

			Gantt g = new Gantt(); g.setId(j.getJ_no());
			g.setParent(j.getJ_refno()); g.setText(j.getJ_name());
			g.setCharger(j.getJ_charger()); g.setStart_date(startD);
			g.setEnd_date(endD); g.setProgress(j.getJ_completeR());
			g.setPname(j.getJ_pname()); g.setJcontent(j.getJ_content());
			g.setU_no(j.getU_no());
			gantt.add(g);
		}
		return gantt;
	}
	
	public ArrayList<Job> jobList3(int p_no) {
		ArrayList<Job> jobs = dao.jobList(p_no);
		for (Job j : jobs) {

			SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
			String startD = sDate.format(j.getJ_startD());
			String endD = sDate.format(j.getJ_endD());

			j.setJ_startD_s(startD);
			j.setJ_endD_s(endD);
		}

		return jobs;
	}

	// Gantt에 표시할 내용.2
	public ArrayList<Job> jobList2(JobSch sch) {
		if (sch.getJ_name() == null) { sch.setJ_name(""); }
		if (sch.getU_no() == null) { sch.setU_no(""); }
		// 총 특정 프로젝트 총 작업 수 설정
		sch.setCount(dao.totcount(sch));
		// 한 페이지에 보여줄 작업수 설정
		if (sch.getPageSize() == 0) { sch.setPageSize(5); }
		sch.setPageCount((int) Math.ceil(sch.getCount() / (double) sch.getPageSize()));
		// 3. 클릭한 현재 페이지(요청값) default값을 1로 선언해준다.
		if (sch.getCurPage() == 0) { sch.setCurPage(1); }
		// 마지막 페이지에서 next를 클릭한 것에 대한 예외 처리.
		if (sch.getCurPage() > sch.getPageCount()) { sch.setCurPage(sch.getPageCount()); }
		// 작업이 아무것도 없을 때 예외처리.
		if (sch.getCurPage() == 0) { sch.setCurPage(1); }
		sch.setEnd(sch.getCurPage() * sch.getPageSize());
		sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
		sch.setBlockSize(5);
		int blocknum = (int) Math.ceil(sch.getCurPage() / (double) sch.getBlockSize());
		int endBlock = blocknum * sch.getBlockSize();
		// 블럭의 마지막 페이지번호는 총페이지수보다 클 수 없다.
		sch.setEndBlock(endBlock > sch.getPageCount() ? sch.getPageCount() : endBlock);
		// 4. startBlock
		// 이전 블럭의 마지막 페이지 번호 + 1 이 현재 블럭의 첫번째 페이지번호
		sch.setStartBlock((blocknum - 1) * sch.getBlockSize() + 1);
		ArrayList<Job> jobs = dao.jobList2(sch);
		for (Job j : jobs) {
			SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
			String startD = sDate.format(j.getJ_startD());
			String endD = sDate.format(j.getJ_endD());
			j.setJ_startD_s(startD);
			j.setJ_endD_s(endD);
		}
		return jobs;
	}

	// 특정 작업 총 갯수2
	public int totcount(JobSch sch) {
		if (sch.getJ_name() == null)
			sch.setJ_name("");
		if (sch.getU_no() == null)
			sch.setU_no("");
		return dao.totcount(sch);
	}

	public ArrayList<Job> jobPeople(int p_no) {
		return dao.jobPeople(p_no);
	}

	public Job jobDetail(int j_no) {

		Job job = dao.jobDetail(j_no);
		SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
		String startD = sDate.format(job.getJ_startD());
		String endD = sDate.format(job.getJ_endD());
		job.setJ_startD_s(startD);
		job.setJ_endD_s(endD);
		String regD = sDate.format(job.getJ_regD());
		String uptD = sDate.format(job.getJ_uptD());
		job.setJ_regD_s(regD);
		job.setJ_uptD_s(uptD);

		return job;
	}
	public void jobInsert(Job ins) {
		SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
		String startD = sDate.format(ins.getJ_startD());
		String endD = sDate.format(ins.getJ_endD());
		ins.setJ_startD_s(startD);
		ins.setJ_endD_s(endD);

		dao.jobInsert(ins);
	}
	
	public void jobDelete(int j_no) {
		dao.jobDelete(j_no);
	}

	public void jobUpdate(Job upt) {

		SimpleDateFormat sDate = new SimpleDateFormat("YYYY/MM/dd");
		String startD = sDate.format(upt.getJ_startD());
		String endD = sDate.format(upt.getJ_endD());
		upt.setJ_startD_s(startD);
		upt.setJ_endD_s(endD);
		dao.jobUpdate(upt);
	}
	// 간트 업데이트
	public void jobUpdate2(Gantt2 g) {
		Job upt = new Job();
		upt.setJ_no(g.getId());
		upt.setJ_name(g.getText());
		upt.setJ_content(g.getJcontent());
		upt.setU_no(g.getU_no());
		upt.setJ_completeR(g.getProgress());
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy/MM/dd");
		String startD = sDate.format(g.getStart_date());
		String endD = sDate.format(g.getEnd_date());
		upt.setJ_startD_s(startD);
		upt.setJ_endD_s(endD);
		dao.jobUpdate(upt);
	}
	
	public Job parentjob(int j_no) {
		return dao.parentjob(j_no);
	}
	
	public void TopjobcomR(int j_refno) {
		dao.TopjobcomR(j_refno);
	}

	public Project projectGet(int p_no) {
		return dao.projectGet(p_no);
	}

	public int jobcount(int p_no) {
		return dao.jobcount(p_no);
	}
}
