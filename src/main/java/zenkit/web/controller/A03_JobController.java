package zenkit.web.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import zenkit.web.dto.JobSch;
import zenkit.web.service.A03_JobService;
import zenkit.web.vo.Gantt;
import zenkit.web.vo.Gantt2;
import zenkit.web.vo.Job;
import zenkit.web.vo.User;

@Controller
@RequestMapping("/job.do")
public class A03_JobController {

	@Autowired(required = false)
	A03_JobService service;

	/* 완료율 리스트 생성. */
	@ModelAttribute("completeN")
	public List<Double> rate() {
		return Arrays.asList(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0);
	}

	/* 페이지 단위 */
	@ModelAttribute("pageO")
	public List<String> tools() {
		return Arrays.asList("5", "10", "15", "20");
	}

	/* 작업게시판 json데이터 */
	// http://localhost:7080/zenkit/job.do?method=data2
	@RequestMapping(params = "method=data2")
	public String jobData2(@ModelAttribute("sch") JobSch sch, Model m, @SessionAttribute("p_no") int p_no) {
		sch.setP_no(p_no);
		m.addAttribute("job", service.jobList2(sch));
		return "pageJsonReport";
	}
	
	/* 작업 게시판 페이지 json ajax처리*/
	// http://localhost:7080/zenkit/job.do?method=list2
	@RequestMapping(params = "method=list")
	public String joblist2(@ModelAttribute("sch") JobSch sch, Model d, @SessionAttribute("p_no") int p_no) {
		sch.setP_no(p_no);
		d.addAttribute("people", service.jobPeople(p_no)); // 해당 프로젝트에 참여하고 있는 인원들 데이터
		d.addAttribute("count", service.totcount(sch)); // 해당 프로젝트별 작업 총 갯수 데이터
		d.addAttribute("job", service.jobList2(sch));
		return "a03_project/a04_JobCRUD2";
	}
	
	
	
	/* Gantt 차트용 json데이터 */
	// http://localhost:7080/zenkit/job.do?method=data
	@RequestMapping(params = "method=data")
	public String jobData(Model m, @SessionAttribute("p_no") int p_no) {
		m.addAttribute("job", service.jobList(p_no));
		return "pageJsonReport";
	}

	/* 작업 gantt 페이지 */
	// http://localhost:7080/zenkit/job.do?method=job
	@RequestMapping(params = "method=job")
	public String job(Model m, @SessionAttribute("p_no") int p_no) {		
		m.addAttribute("project", service.projectGet(p_no)); // 특정 프로젝트 정보 데이터 (PM인지 예외처리할때 사용, 프로젝트명 select을 위해 사용)
		m.addAttribute("people", service.jobPeople(p_no)); // 특정 프로젝트에 참여한 참여인원들의 정보[담당자 select할때 사용(번호,이름)]
		return "a03_project/a04_Job";
	}

	/* 작업 게시판 페이지 jstl 사용 
	// http://localhost:7080/zenkit/job.do?method=list
	@RequestMapping(params = "method=list")
	public String joblist(@ModelAttribute("sch") JobSch sch, Model d, @SessionAttribute("p_no") int p_no) {
		sch.setP_no(p_no);
		d.addAttribute("people", service.jobPeople(p_no)); // 해당 프로젝트에 참여하고 있는 인원들 데이터
		d.addAttribute("count", service.totcount(sch)); // 해당 프로젝트별 작업 총 갯수 데이터
		d.addAttribute("joblist", service.jobList2(sch)); // 게시판용 작업 데이터
		return "a03_project/a04_JobCRUD";
	}
	*/

	/* 작업상세페이지 */
	// http://localhost:7080/zenkit/job.do?method=detail
	@RequestMapping(params = "method=detail")
	public String jobDetail(@RequestParam int no, Model d, @SessionAttribute("p_no") int p_no, @ModelAttribute("sch") JobSch sch) {
		d.addAttribute("project", service.projectGet(p_no)); // 특정 프로젝트 정보 데이터 (PM인지 예외처리할때 사용)
		d.addAttribute("people", service.jobPeople(p_no)); // 특정 프로젝트에 참여한 참여인원들의 정보[담당자 select할때 사용(번호,이름)]
		d.addAttribute("parentJob", service.parentjob(no)); // 특정 작업의 상위작업 데이터 (상위작업 Part에 작업명표시를 위해)
		d.addAttribute("jobdetail", service.jobDetail(no)); // 특정 작업 데이터
		return "a03_project/a04_JobDetail";
	}

	/* 작업 등록 페이지 */
	// http://localhost:7080/zenkit/job.do?method=insertForm
	@RequestMapping(params = "method=insertForm")
	public String jobInsertF(@ModelAttribute("job") JobSch sch, Model d, @SessionAttribute("p_no") int p_no) {
		sch.setP_no(p_no);
		d.addAttribute("project", service.projectGet(p_no)); // 특정 프로젝트 정보 데이터 (PM인지 예외처리할때 사용, 프로젝트명 select을 위해 사용)
		d.addAttribute("people", service.jobPeople(p_no)); // 특정 프로젝트에 참여한 참여인원들의 정보[담당자 select할때 사용(번호,이름)]
		d.addAttribute("joblist", service.jobList2(sch)); // 프로젝트의 데이터가져오기( 상위 작업 목록 데이터 select을 위해 사용)
		return "a03_project/a04_JobInsert";
	}

	/* 작업 등록 처리 */
	// http://localhost:7080/zenkit/job.do?method=insert
	@RequestMapping(params = "method=insert")
	public String jobInsert(Job job, Model d) {
		service.jobInsert(job);
		d.addAttribute("proc", "insert");
		return "forward:/job.do?method=insertForm";
	}

	/* 작업 업데이트 처리 */
	// http://localhost:7080/zenkit/job.do?method=update
	@RequestMapping(params = "method=update")
	public String jobUpdate(Job job, Model d) {
		service.jobUpdate(job); // 작업데이터 업데이트 처리
		service.TopjobcomR(job.getJ_refno()); // 업데이트된 완료율 상위작업에 적용 처리
		d.addAttribute("proc", "update"); // update 처리시 list이동
		return "a03_project/a04_JobDetail";
	}

	/* 작업 삭제처리 */
	// http://localhost:7080/zenkit/job.do?method=delete
	@RequestMapping(params = "method=delete")
	public String jobDelete(Job job, Model d) {
		service.jobDelete(job.getJ_no()); // 작업 데이터 삭제 처리
		d.addAttribute("proc", "delete"); // delete 처리시 list이동
		return "a03_project/a04_JobDetail";
	}

	// Gantt 업데이트
	// http://localhost:7080/zenkit/job.do?method=update2
	@RequestMapping(params = "method=update2")
	public String jobUpdate2(Gantt2 g, Model d) {
		service.TopjobcomR(g.getParent());
		service.jobUpdate2(g);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	// Gantt 삭제
	// http://localhost:7080/zenkit/job.do?method=delete2
	@RequestMapping(params = "method=delete2")
	public String jobDelete2(Gantt2 g, Model d) {
		service.jobDelete(g.getId()); // 작업 데이터 삭제 처리
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
	// Gantt 등록
	// http://localhost:7080/zenkit/job.do?method=insert2
	@RequestMapping(params = "method=insert2")
	public String jobInsert2(Gantt2 g, Model d, @SessionAttribute("p_no") int p_no, @SessionAttribute("sesMem") User user1) {
		g.setU_no(user1.getU_no());
		g.setP_no(p_no);
		service.jobInsert2(g);
		d.addAttribute("success","Y");
		return "pageJsonReport";
	}
	
}
