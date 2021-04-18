package zenkit.web.dto;

public class JobStateCnt {
	private int cnt1;
	private int cnt2;
	private int cnt3;
	
	public JobStateCnt() {
		
	}

	public JobStateCnt(int cnt1, int cnt2, int cnt3) {
		super();
		this.cnt1 = cnt1;
		this.cnt2 = cnt2;
		this.cnt3 = cnt3;
	}

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public int getCnt2() {
		return cnt2;
	}

	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}

	public int getCnt3() {
		return cnt3;
	}

	public void setCnt3(int cnt3) {
		this.cnt3 = cnt3;
	}
	
}
