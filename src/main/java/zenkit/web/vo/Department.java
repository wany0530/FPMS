package zenkit.web.vo;

public class Department {
	private int d_no;
	private String d_name;
	
	public Department() {
		// TODO Auto-generated constructor stub
	}

	public Department(int d_no, String d_name) {
		super();
		this.d_no = d_no;
		this.d_name = d_name;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	
}
