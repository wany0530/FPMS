package zenkit.web.dto;

import zenkit.web.vo.Project;

public class UpProject extends Project {
	private int outputCnt;
	private int riskCnt;
	private int u_no;
	
	public int getOutputCnt() {
		return outputCnt;
	}
	public void setOutputCnt(int outputCnt) {
		this.outputCnt = outputCnt;
	}
	public int getRiskCnt() {
		return riskCnt;
	}
	public void setRiskCnt(int riskCnt) {
		this.riskCnt = riskCnt;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
}
