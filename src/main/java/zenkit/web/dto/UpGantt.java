package zenkit.web.dto;

import zenkit.web.vo.Gantt;

public class UpGantt extends Gantt{
	private double totProgress;
	
	public UpGantt() {
		// TODO Auto-generated constructor stub
	}

	public UpGantt(double totProgress) {
		super();
		this.totProgress = totProgress;
	}

	public double getTotProgress() {
		return totProgress;
	}

	public void setTotProgress(double totProgress) {
		this.totProgress = totProgress;
	}
}
