package zenkit.web.dto;

public class UserSch {
	private String u_id;
	private String u_name;
	private String d_name;
	private String pos_name;
	private String r_name;
	
	public UserSch() {
		// TODO Auto-generated constructor stub
	}

	public UserSch(String u_id, String u_name, String d_name, String r_name, String pos_name) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.d_name = d_name;
		this.r_name = r_name;
		this.pos_name = pos_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
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
