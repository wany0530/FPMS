package zenkit.web.vo;

public class User {
	private int u_no;
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_email;
	private String u_phone;
	private String u_img;
	private int d_no;
	private int pos_no;
	private int r_no;
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(int u_no, String u_id, String u_pass, String u_name, String u_email, String u_phone, String u_img,
			int d_no, int pos_no, int r_no) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_name = u_name;
		this.u_email = u_email;
		this.u_phone = u_phone;
		this.u_img = u_img;
		this.d_no = d_no;
		this.pos_no = pos_no;
		this.r_no = r_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getPos_no() {
		return pos_no;
	}
	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
}
