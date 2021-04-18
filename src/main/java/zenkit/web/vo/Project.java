package zenkit.web.vo;

import java.util.Date;

public class Project {
	private int p_no;
	private String p_name;
	private Date p_startD;
	private Date p_endD;
	private String p_startD_s;
	private String p_endD_s;
	private String p_content;
	private String p_pm;
	private int d_no;
	
	public Project() {
		// TODO Auto-generated constructor stub
	}
	public Project(int p_no, String p_name, Date p_startD, Date p_endD, String p_startD_s, String p_endD_s,
			String p_content, String p_pm, int d_no) {
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
	
}
