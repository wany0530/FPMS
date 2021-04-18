package zenkit.web.vo;

public class JobInfo extends Job2 {
	private int cnt;
	private String p_name;
	private String pm_name;
	private String ingstate;
	
	public JobInfo() {
		super();
	}
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getPm_name() {
		return pm_name;
	}

	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getIngstate() {
		return ingstate;
	}
	public void setIngstate(String ingstate) {
		this.ingstate = ingstate;
	}
}
