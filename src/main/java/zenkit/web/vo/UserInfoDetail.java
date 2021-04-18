package zenkit.web.vo;

public class UserInfoDetail extends User{
	private String d_name;
	private String r_name;
	private String pos_name;
	
	public UserInfoDetail() {
		// TODO Auto-generated constructor stub
	}

	public UserInfoDetail(String d_name, String r_name, String pos_name) {
		super();
		this.d_name = d_name;
		this.r_name = r_name;
		this.pos_name = pos_name;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getPos_name() {
		return pos_name;
	}

	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
}
