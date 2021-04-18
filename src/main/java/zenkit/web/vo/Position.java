package zenkit.web.vo;

public class Position {
	private int pos_no;
	private String pos_name;
	
	public Position() {
		// TODO Auto-generated constructor stub
	}

	public Position(int pos_no, String pos_name) {
		super();
		this.pos_no = pos_no;
		this.pos_name = pos_name;
	}

	public int getPos_no() {
		return pos_no;
	}

	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}

	public String getPos_name() {
		return pos_name;
	}

	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	
}
