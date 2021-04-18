package zenkit.web.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

public class test {

	public static void main(String[] args) {
		String filename = "/Users/wangsungtaek/taek/workspace/zenkit/WebContent/z03_upload/output/28";
		
		File f = new File(filename);
		
		System.out.println(f.exists());
	}
}
