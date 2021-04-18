package zenkit.web.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class A00_FileuploadService {
	
	@Value("${upload}")
	String uploadPath;
	
	public void profileImg() {
		
	}
}
