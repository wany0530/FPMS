package zenkit.web.vo;

public class Resource {
	private int u_no;
	private int p_no;
	
	public Resource() {
		// TODO Auto-generated constructor stub
	}

	public Resource(int u_no, int p_no) {
		super();
		this.u_no = u_no;
		this.p_no = p_no;
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
	
}
