package zenkit.web.vo;
// zenkit.web.vo.DashBoard 

import java.util.Date;

public class DashBoard {
	private int p_no;
	private int d_no;
	private int u_no;
	private int j_no;
	private int o_no;
	private String p_name;
	private String p_pm;
	private String d_name;
	private Date p_startD;
	private Date p_endD;
	private int poCnt;
	private int dDay;
	private int percent;
	private String progress;
	
	
	public DashBoard() {
		super();
	}
	
	
	public DashBoard(int p_no, int d_no, int u_no, int j_no, int o_no, String p_name, String p_pm, String d_name,
			Date p_startD, Date p_endD, int poCnt, int dDay, int percent, String progress) {
		super();
		this.p_no = p_no;
		this.d_no = d_no;
		this.u_no = u_no;
		this.j_no = j_no;
		this.o_no = o_no;
		this.p_name = p_name;
		this.p_pm = p_pm;
		this.d_name = d_name;
		this.p_startD = p_startD;
		this.p_endD = p_endD;
		this.poCnt = poCnt;
		this.dDay = dDay;
		this.percent = percent;
		this.progress = progress;
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
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
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
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getJ_no() {
		return j_no;
	}
	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	public int getPoCnt() {
		return poCnt;
	}
	public void setPoCnt(int poCnt) {
		this.poCnt = poCnt;
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


	public String getProgress() {
		return progress;
	}


	public void setProgress(String progress) {
		this.progress = progress;
	}
	

}
