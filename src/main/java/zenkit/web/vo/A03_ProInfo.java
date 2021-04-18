package zenkit.web.vo;

public class A03_ProInfo {
	private int p_no;
	private String p_name;
	private String p_content;
	private String u_name;
	private String d_name;
	public A03_ProInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public A03_ProInfo(int p_no, String p_name, String p_content, String u_name, String d_name) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_content = p_content;
		this.u_name = u_name;
		this.d_name = d_name;
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
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	

}
