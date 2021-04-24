package zenkit.web.vo;

public class Gantt {
	private int id; 
	private String text;
	private String start_date; 
	private String end_date;
	private double progress; 
	private int parent;
	private String charger; 
	private String pname;
	private String jcontent; 
	private int u_no;

	public int getU_no() { return u_no; }
	
	public void setU_no(int u_no) { this.u_no = u_no; }
	
	public String getPname() { return pname; }
	
	public void setPname(String pname) { this.pname = pname; }
	
	public String getJcontent() { return jcontent; }
	
	public void setJcontent(String jcontent) { this.jcontent = jcontent; }
	
	public String getCharger() { return charger; }
	
	public void setCharger(String charger) { this.charger = charger; }
	
	public int getId() { return id; }
	
	public void setId(int id) { this.id = id; }
	
	public String getText() { return text; }
	
	public void setText(String text) { this.text = text; }

	public String getStart_date() { return start_date; }

	public void setStart_date(String start_date) { this.start_date = start_date; }

	public String getEnd_date() { return end_date; }

	public void setEnd_date(String end_date) { this.end_date = end_date; }

	public double getProgress() { return progress; }

	public void setProgress(double progress) { this.progress = progress; }

	public int getParent() { return parent; }

	public void setParent(int parent) { this.parent = parent; }
}
