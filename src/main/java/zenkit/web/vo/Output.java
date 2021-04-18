package zenkit.web.vo;

public class Output {
	private int o_no;
	private String o_name;
	private String o_path;
	private String o_content;
	
	private int j_no;
	
	public Output() {
		// TODO Auto-generated constructor stub
	}

	public Output(int o_no, String o_name, String o_path, String o_content, int j_no) {
		super();
		this.o_no = o_no;
		this.o_name = o_name;
		this.o_path = o_path;
		this.o_content = o_content;
		this.j_no = j_no;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_path() {
		return o_path;
	}

	public void setO_path(String o_path) {
		this.o_path = o_path;
	}

	public String getO_content() {
		return o_content;
	}

	public void setO_content(String o_content) {
		this.o_content = o_content;
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	
}
