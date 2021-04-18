package zenkit.web.vo;

import java.util.Date;

// zenkit.web.vo.ProjDashBoard 
public class ProjDashBoard {
	private int p_no;
	private String p_name;
	private Date p_startD;
	private Date p_endD;
	private String p_startD_s;
	private String p_endD_s;
	private String p_content;
	private String p_pm;
	private int d_no;
	private int u_no;
	private int percent;
	private String u_name;
	private String r_name;
	private String pos_name;
	private int r_no;
	private int pos_no;
	private String j_name;
	private int j_completer;
	private Date j_endD;
	private int j_refno;
	
	
	public ProjDashBoard() {
		super();
	}	

	public ProjDashBoard(int p_no) {
		super();
		this.p_no = p_no;
	}


	public ProjDashBoard(int p_no, String p_name, Date p_startD, Date p_endD, String p_startD_s, String p_endD_s,
			String p_content, String p_pm, int d_no, int u_no, int percent, String u_name, String r_name,
			String pos_name, int r_no, int pos_no, String j_name, int j_completer, Date j_endD, int j_refno) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_startD = p_startD;
		this.p_endD = p_endD;
		this.p_startD_s = p_startD_s;
		this.p_endD_s = p_endD_s;
		this.p_content = p_content;
		this.p_pm = p_pm;
		this.d_no = d_no;
		this.u_no = u_no;
		this.percent = percent;
		this.u_name = u_name;
		this.r_name = r_name;
		this.pos_name = pos_name;
		this.r_no = r_no;
		this.pos_no = pos_no;
		this.j_name = j_name;
		this.j_completer = j_completer;
		this.j_endD = j_endD;
		this.j_refno = j_refno;
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

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_pm() {
		return p_pm;
	}

	public void setP_pm(String p_pm) {
		this.p_pm = p_pm;
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

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getPos_name() {
		return pos_name;
	}

	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getPos_no() {
		return pos_no;
	}

	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}

	public String getJ_name() {
		return j_name;
	}

	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}

	public int getJ_completer() {
		return j_completer;
	}

	public void setJ_completer(int j_completer) {
		this.j_completer = j_completer;
	}

	public Date getJ_endD() {
		return j_endD;
	}

	public void setJ_endD(Date j_endD) {
		this.j_endD = j_endD;
	}

	public int getJ_refno() {
		return j_refno;
	}

	public void setJ_refno(int j_refno) {
		this.j_refno = j_refno;
	}
	
	
	
}
