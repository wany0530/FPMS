package zenkit.web.controller;

public class test {

	public static void main(String[] args) {
		
		String a = "\\output\\p_15\\o_49\\요구사항정의서.txt";
		
		String b = a.replaceAll("\\", "/");
		System.out.println(b);
	}

}
