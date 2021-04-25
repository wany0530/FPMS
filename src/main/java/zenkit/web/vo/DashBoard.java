package zenkit.web.vo;
// zenkit.web.vo.DashBoard 

import java.util.Date;

public class DashBoard {
	// 유저
	private int u_no;
	private String u_name;
	private String u_id;
	// 부서
	private int d_no;
	private String d_name;
	// 프로젝트
	private int p_no;
	private String p_name;
	private String p_pm;
	private String pm_name;
	private Date p_startD;
	private Date p_endD;
	private int percent;
	private int dDay;
	// 작업
	private int j_no;
	private double j_completer;
	private int j_refno;
	private String progress_state; // 진행상태
	private int progress_rt; // 진행율
	private int job_cnt; // 작업개수
	// 리스크
	private int r_no;		
	private int risk_cnt; // 리스크개수
	
	// pieChart 프로젝트 작업상태
	private int beforeCnt;
	private int ongoingCnt;
	private int doneCnt;
	
	private int rOpenCnt;
	private int rDoneCnt;
	private int rOngoingCnt;
	private int rCancelCnt;
	private int rHoldCnt;

	
	public DashBoard() {
		super();
	}


	public DashBoard(int u_no, String u_name, String u_id, int d_no, String d_name, int p_no, String p_name,
			String p_pm, String pm_name, Date p_startD, Date p_endD, int percent, int j_no, double j_completer,
			int j_refno, String progress_state, int progress_rt, int job_cnt, int r_no, int risk_cnt, int beforeCnt,
			int ongoingCnt, int doneCnt, int rOpenCnt, int rDoneCnt, int rOngoingCnt, int rCancelCnt, int rHoldCnt) {
		super();
		this.u_no = u_no;
		this.u_name = u_name;
		this.u_id = u_id;
		this.d_no = d_no;
		this.d_name = d_name;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_pm = p_pm;
		this.pm_name = pm_name;
		this.p_startD = p_startD;
		this.p_endD = p_endD;
		this.percent = percent;
		this.j_no = j_no;
		this.j_completer = j_completer;
		this.j_refno = j_refno;
		this.progress_state = progress_state;
		this.progress_rt = progress_rt;
		this.job_cnt = job_cnt;
		this.r_no = r_no;
		this.risk_cnt = risk_cnt;
		this.beforeCnt = beforeCnt;
		this.ongoingCnt = ongoingCnt;
		this.doneCnt = doneCnt;
		this.rOpenCnt = rOpenCnt;
		this.rDoneCnt = rDoneCnt;
		this.rOngoingCnt = rOngoingCnt;
		this.rCancelCnt = rCancelCnt;
		this.rHoldCnt = rHoldCnt;
	}


	public int getdDay() {
		return dDay;
	}


	public void setdDay(int dDay) {
		this.dDay = dDay;
	}


	public int getU_no() {
		return u_no;
	}


	public void setU_no(int u_no) {
		this.u_no = u_no;
	}


	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public int getD_no() {
		return d_no;
	}


	public void setD_no(int d_no) {
		this.d_no = d_no;
	}


	public String getD_name() {
		return d_name;
	}


	public void setD_name(String d_name) {
		this.d_name = d_name;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_pm() {
		return p_pm;
	}


	public void setP_pm(String p_pm) {
		this.p_pm = p_pm;
	}


	public String getPm_name() {
		return pm_name;
	}


	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}


	public Date getP_startD() {
		return p_startD;
	}


	public void setP_startD(Date p_startD) {
		this.p_startD = p_startD;
	}


	public Date getP_endD() {
		return p_endD;
	}


	public void setP_endD(Date p_endD) {
		this.p_endD = p_endD;
	}


	public int getPercent() {
		return percent;
	}


	public void setPercent(int percent) {
		this.percent = percent;
	}


	public int getJ_no() {
		return j_no;
	}


	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}


	public double getJ_completer() {
		return j_completer;
	}


	public void setJ_completer(double j_completer) {
		this.j_completer = j_completer;
	}


	public int getJ_refno() {
		return j_refno;
	}


	public void setJ_refno(int j_refno) {
		this.j_refno = j_refno;
	}


	public String getProgress_state() {
		return progress_state;
	}


	public void setProgress_state(String progress_state) {
		this.progress_state = progress_state;
	}


	public int getProgress_rt() {
		return progress_rt;
	}


	public void setProgress_rt(int progress_rt) {
		this.progress_rt = progress_rt;
	}


	public int getJob_cnt() {
		return job_cnt;
	}


	public void setJob_cnt(int job_cnt) {
		this.job_cnt = job_cnt;
	}


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public int getRisk_cnt() {
		return risk_cnt;
	}


	public void setRisk_cnt(int risk_cnt) {
		this.risk_cnt = risk_cnt;
	}


	public int getBeforeCnt() {
		return beforeCnt;
	}


	public void setBeforeCnt(int beforeCnt) {
		this.beforeCnt = beforeCnt;
	}


	public int getOngoingCnt() {
		return ongoingCnt;
	}


	public void setOngoingCnt(int ongoingCnt) {
		this.ongoingCnt = ongoingCnt;
	}


	public int getDoneCnt() {
		return doneCnt;
	}


	public void setDoneCnt(int doneCnt) {
		this.doneCnt = doneCnt;
	}


	public int getrOpenCnt() {
		return rOpenCnt;
	}


	public void setrOpenCnt(int rOpenCnt) {
		this.rOpenCnt = rOpenCnt;
	}


	public int getrDoneCnt() {
		return rDoneCnt;
	}


	public void setrDoneCnt(int rDoneCnt) {
		this.rDoneCnt = rDoneCnt;
	}


	public int getrOngoingCnt() {
		return rOngoingCnt;
	}


	public void setrOngoingCnt(int rOngoingCnt) {
		this.rOngoingCnt = rOngoingCnt;
	}


	public int getrCancelCnt() {
		return rCancelCnt;
	}


	public void setrCancelCnt(int rCancelCnt) {
		this.rCancelCnt = rCancelCnt;
	}


	public int getrHoldCnt() {
		return rHoldCnt;
	}


	public void setrHoldCnt(int rHoldCnt) {
		this.rHoldCnt = rHoldCnt;
	}




	
	

}