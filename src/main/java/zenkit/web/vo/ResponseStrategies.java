package zenkit.web.vo;

public enum ResponseStrategies {
	
	AVOID("회피"),
	TRANSFER("전가"),
	MITIGATE("완화"),
	ACCEPT("수용");
	
	
	private String title;
	
	ResponseStrategies(String title) {
		this.title = title;
	}
	public String getCode() { return name(); }
	public String getTitle() { return title; }

}