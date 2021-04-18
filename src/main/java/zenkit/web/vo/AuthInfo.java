package zenkit.web.vo;


// zenkit.web.vo.AuthInfo
public class AuthInfo extends Auth {
	private int cnt;
	private int req_no;
	private String req_name;
	private int res_no;
	private String res_name;
	private int p_no;
	private String pro_name;
	private String job_name;
	
	public AuthInfo() {
		super();
	}
	public AuthInfo(String pro_name, String job_name) {
		super();
		this.pro_name = pro_name;
		this.job_name = job_name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getReq_no() {
		return req_no;
	}

	public void setReq_no(int req_no) {
		this.req_no = req_no;
	}

	public String getReq_name() {
		return req_name;
	}

	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getPro_name() {
		return pro_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	
}
