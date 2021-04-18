package zenkit.web.vo;

import java.util.Date;

public class Auth {
	private int a_no;
	private Date a_date;
	private String a_date_s;
	private String a_resultN;
	private String a_requestN;
	private int a_requestP;
	
	private int j_no;
	private String a_name;
	
	public Auth() {
		// TODO Auto-generated constructor stub
	}

	public Auth(int a_no, Date a_date, String a_date_s, String a_resultN, String a_requestN, int a_requestP, int j_no,
			String a_name) {
		super();
		this.a_no = a_no;
		this.a_date = a_date;
		this.a_date_s = a_date_s;
		this.a_resultN = a_resultN;
		this.a_requestN = a_requestN;
		this.a_requestP = a_requestP;
		this.j_no = j_no;
		this.a_name = a_name;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getA_date_s() {
		return a_date_s;
	}

	public void setA_date_s(String a_date_s) {
		this.a_date_s = a_date_s;
	}

	public String getA_resultN() {
		return a_resultN;
	}

	public void setA_resultN(String a_resultN) {
		this.a_resultN = a_resultN;
	}

	public String getA_requestN() {
		return a_requestN;
	}

	public void setA_requestN(String a_requestN) {
		this.a_requestN = a_requestN;
	}

	public int getA_requestP() {
		return a_requestP;
	}

	public void setA_requestP(int a_requestP) {
		this.a_requestP = a_requestP;
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	
}
