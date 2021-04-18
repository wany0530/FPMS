package zenkit.web.vo;

import java.util.Date;

public class AllDashBoard {
	// 프로젝트
	private int p_no;
	private String p_name;
	private Date p_startD;
	private Date p_endD;
	private String p_startD_s;
	private String p_endD_s;
	private int dDay;
	private int percent;
	private int pYear1;
	private int pYear2;
	private String progress;
	// 부서
	private int d_no;
	private String d_name;
	private String pmName;
	// 유저
	private int u_no;
	private String u_name;
	// 직급
	private int pos_no;
	// 작업
	private int j_no;
	private int j_refno;
	private int j_completer;
	// 산출물
	private int o_no;
	private int poCnt;
	// 카운트 문자열
	private String allCnt;
	private String before_Cnt;
	private String ongoing_Cnt;
	private String complete_Cnt;
	private String late_Cnt;
	 
	public AllDashBoard() {
		super();
	}
	public AllDashBoard(int p_no, String p_name, Date p_startD, Date p_endD, String p_startD_s, String p_endD_s,
			int dDay, int percent, int pYear1, int pYear2, String progress, int d_no, String d_name, String pmName,
			int u_no, String u_name, int pos_no, int j_no, int j_refno, int j_completer, int o_no, int poCnt,
			String allCnt, String before_Cnt, String ongoing_Cnt, String complete_Cnt, String late_Cnt) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_startD = p_startD;
		this.p_endD = p_endD;
		this.p_startD_s = p_startD_s;
		this.p_endD_s = p_endD_s;
		this.dDay = dDay;
		this.percent = percent;
		this.pYear1 = pYear1;
		this.pYear2 = pYear2;
		this.progress = progress;
		this.d_no = d_no;
		this.d_name = d_name;
		this.pmName = pmName;
		this.u_no = u_no;
		this.u_name = u_name;
		this.pos_no = pos_no;
		this.j_no = j_no;
		this.j_refno = j_refno;
		this.j_completer = j_completer;
		this.o_no = o_no;
		this.poCnt = poCnt;
		this.allCnt = allCnt;
		this.before_Cnt = before_Cnt;
		this.ongoing_Cnt = ongoing_Cnt;
		this.complete_Cnt = complete_Cnt;
		this.late_Cnt = late_Cnt;
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
	public String getP_startD_s() {
		return p_startD_s;
	}
	public void setP_startD_s(String p_startD_s) {
		this.p_startD_s = p_startD_s;
	}
	public String getP_endD_s() {
		return p_endD_s;
	}
	public void setP_endD_s(String p_endD_s) {
		this.p_endD_s = p_endD_s;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
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
	public String getPmName() {
		return pmName;
	}
	public void setPmName(String pmName) {
		this.pmName = pmName;
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
	public int getPos_no() {
		return pos_no;
	}
	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getPoCnt() {
		return poCnt;
	}
	public void setPoCnt(int poCnt) {
		this.poCnt = poCnt;
	}

	public int getpYear1() {
		return pYear1;
	}

	public void setpYear1(int pYear1) {
		this.pYear1 = pYear1;
	}

	public int getpYear2() {
		return pYear2;
	}

	public void setpYear2(int pYear2) {
		this.pYear2 = pYear2;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getJ_refno() {
		return j_refno;
	}
	public void setJ_refno(int j_refno) {
		this.j_refno = j_refno;
	}
	public int getJ_completer() {
		return j_completer;
	}
	public void setJ_completer(int j_completer) {
		this.j_completer = j_completer;
	}
	public String getAllCnt() {
		return allCnt;
	}
	public void setAllCnt(String allCnt) {
		this.allCnt = allCnt;
	}
	public String getBefore_Cnt() {
		return before_Cnt;
	}
	public void setBefore_Cnt(String before_Cnt) {
		this.before_Cnt = before_Cnt;
	}
	public String getOngoing_Cnt() {
		return ongoing_Cnt;
	}
	public void setOngoing_Cnt(String ongoing_Cnt) {
		this.ongoing_Cnt = ongoing_Cnt;
	}
	public String getComplete_Cnt() {
		return complete_Cnt;
	}
	public void setComplete_Cnt(String complete_Cnt) {
		this.complete_Cnt = complete_Cnt;
	}
	public String getLate_Cnt() {
		return late_Cnt;
	}
	public void setLate_Cnt(String late_Cnt) {
		this.late_Cnt = late_Cnt;
	}
	
	
	
	
}
