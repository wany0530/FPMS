package zenkit.web.dto;

import zenkit.web.vo.Risk;

public class UpRisk extends Risk{

	private int u_no;
	
	public UpRisk() {
		// TODO Auto-generated constructor stub
	}

	public UpRisk(int u_no) {
		super();
		this.u_no = u_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
}
