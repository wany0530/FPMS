package zenkit.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadViewer extends AbstractView{
	
	@Value("${upload}")
	String uploadPath;
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
		// 파일이 존재하는 물리적 경리 + 파일이름
		String filePath = uploadPath + File.separator + (String)model.get("downloadFile");
		File file = new File(filePath);
		
		// 파일 이름 얻기
		Path p = Paths.get(filePath);
		String fname = p.getFileName().toString();
		System.out.println("filePath"+filePath);

		// 파일 읽기
		response.setContentType("application/download; charset-utf-8");
		response.setContentLength((int)file.length());
		fname = URLEncoder.encode(fname, "utf-8").replaceAll("\\+", " ");
		response.setHeader("Content-Disposition",
				"attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(fis, out);
		out.flush();
		
	}
}
