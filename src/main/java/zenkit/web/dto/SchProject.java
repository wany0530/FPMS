package zenkit.web.dto;

public class SchProject {
	private int u_no;
	private String schWord;
	private int currPage;
	private int count;
	private int startNum;
	private int endNum;
	
	public SchProject() {
		// TODO Auto-generated constructor stub
	}
	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getSchWord() {
		return schWord;
	}

	public void setSchWord(String schWord) {
		this.schWord = schWord;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
