package zenkit.web.vo;

import java.util.Date;

public class Job2 {
	private int level;
	private int j_no;
	private int j_refno;
	private String j_pname;
	private String j_name;
	private String j_content;
	/*
	 * private String j_startD; private String j_endD;
	 */
	private Date j_startD;
	private Date j_endD;
	private String j_startD_s;
	private String j_endD_s;
	
	private String j_regD;
	private String j_uptD;
	private String j_charger;
	private double j_completeR;
	private int u_no;
	private String u_name;
	private int p_no;

	///////
	


	/////////////////////////////////
	
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public Date getJ_startD() {
		return j_startD;
	}

	public void setJ_startD(Date j_startD) {
		this.j_startD = j_startD;
	}

	public Date getJ_endD() {
		return j_endD;
	}

	public void setJ_endD(Date j_endD) {
		this.j_endD = j_endD;
	}

	public String getJ_startD_s() {
		return j_startD_s;
	}

	public void setJ_startD_s(String j_startD_s) {
		this.j_startD_s = j_startD_s;
	}

	public String getJ_endD_s() {
		return j_endD_s;
	}

	public void setJ_endD_s(String j_endD_s) {
		this.j_endD_s = j_endD_s;
	}

	public String getU_name() {
		return u_name;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getJ_pname() {
		return j_pname;
	}

	public void setJ_pname(String j_pname) {
		this.j_pname = j_pname;
	}

	public String getJ_regD() {
		return j_regD;
	}

	public void setJ_regD(String j_regD) {
		this.j_regD = j_regD;
	}

	public String getJ_uptD() {
		return j_uptD;
	}

	public void setJ_uptD(String j_uptD) {
		this.j_uptD = j_uptD;
	}

	public String getJ_content() {
		return j_content;
	}

	public void setJ_content(String j_content) {
		this.j_content = j_content;
	}

	public String getJ_charger() {
		return j_charger;
	}

	public void setJ_charger(String j_charger) {
		this.j_charger = j_charger;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}

	public int getJ_refno() {
		return j_refno;
	}

	public void setJ_refno(int j_refno) {
		this.j_refno = j_refno;
	}

	public String getJ_name() {
		return j_name;
	}

	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}

	public double getJ_completeR() {
		return j_completeR;
	}

	public void setJ_completeR(double j_completeR) {
		this.j_completeR = j_completeR;
	}
}