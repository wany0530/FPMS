package zenkit.web.vo;

import java.util.Date;

public class RiskAction {
 
	private int ac_no;
	private String ac_receive;
	private String ac_name;
	private Date ac_date;
	private String ac_date_s;
	private String ac_state;
    private int r_no;
	
    
    public RiskAction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RiskAction(int ac_no, String ac_receive, String ac_name, Date ac_date, String ac_date_s, String ac_state,
			int r_no) {
		super();
		this.ac_no = ac_no;
		this.ac_receive = ac_receive;
		this.ac_name = ac_name;
		this.ac_date = ac_date;
		this.ac_date_s = ac_date_s;
		this.ac_state = ac_state;
		this.r_no = r_no;
	}
	public int getAc_no() {
		return ac_no;
	}
	public void setAc_no(int ac_no) {
		this.ac_no = ac_no;
	}
	public String getAc_receive() {
		return ac_receive;
	}
	public void setAc_receive(String ac_receive) {
		this.ac_receive = ac_receive;
	}
	public String getAc_name() {
		return ac_name;
	}
	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}
	public Date getAc_date() {
		return ac_date;
	}
	public void setAc_date(Date ac_date) {
		this.ac_date = ac_date;
	}
	public String getAc_date_s() {
		return ac_date_s;
	}
	public void setAc_date_s(String ac_date_s) {
		this.ac_date_s = ac_date_s;
	}
	public String getAc_state() {
		return ac_state;
	}
	public void setAc_state(String ac_state) {
		this.ac_state = ac_state;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
}
