package zenkit.web.vo;

import java.util.Date;

public class Calendar {
	private int c_no;
	private String c_title;
	private Date c_startD;
	private Date c_endD;
	private String c_startD_s;
	private String c_endD_s;
	private String c_content;
	
	private int u_no;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public Calendar(int c_no, String c_title, Date c_startD, Date c_endD, String c_startD_s, String c_endD_s,
			String c_content, int u_no) {
		super();
		this.c_no = c_no;
		this.c_title = c_title;
		this.c_startD = c_startD;
		this.c_endD = c_endD;
		this.c_startD_s = c_startD_s;
		this.c_endD_s = c_endD_s;
		this.c_content = c_content;
		this.u_no = u_no;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public Date getC_startD() {
		return c_startD;
	}

	public void setC_startD(Date c_startD) {
		this.c_startD = c_startD;
	}

	public Date getC_endD() {
		return c_endD;
	}

	public void setC_endD(Date c_endD) {
		this.c_endD = c_endD;
	}

	public String getC_startD_s() {
		return c_startD_s;
	}

	public void setC_startD_s(String c_startD_s) {
		this.c_startD_s = c_startD_s;
	}

	public String getC_endD_s() {
		return c_endD_s;
	}

	public void setC_endD_s(String c_endD_s) {
		this.c_endD_s = c_endD_s;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	
}
