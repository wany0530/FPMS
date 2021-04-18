package zenkit.web.vo;

public class Rank {
	private int r_no;
	private String r_name;
	
	public Rank() {
		// TODO Auto-generated constructor stub
	}

	public Rank(int r_no, String r_name) {
		super();
		this.r_no = r_no;
		this.r_name = r_name;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	
}
