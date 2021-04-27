package zenkit.web.dto;

public class AddResource {
	private int p_no;
	private String u_name;
	private int u_no;
	
	public AddResource() {
		// TODO Auto-generated constructor stub
	}

	public AddResource(int p_no, String u_name) {
		super();
		this.p_no = p_no;
		this.u_name = u_name;
	}
	public AddResource(int p_no, int u_no) {
		super();
		this.p_no = p_no;
		this.u_no = u_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
}
