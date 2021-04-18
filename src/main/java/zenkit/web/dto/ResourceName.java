package zenkit.web.dto;

import zenkit.web.vo.Resource;

public class ResourceName extends Resource{
	private String u_name;
	private String r_name;
	private String pos_name;
	
	public ResourceName() {
		// TODO Auto-generated constructor stub
	}

	public ResourceName(String u_name, String r_name, String pos_name) {
		super();
		this.u_name = u_name;
		this.r_name = r_name;
		this.pos_name = pos_name;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
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
