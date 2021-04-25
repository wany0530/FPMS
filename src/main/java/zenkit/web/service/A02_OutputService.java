package zenkit.web.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import zenkit.web.dao.A02_OutputDao;
import zenkit.web.dto.OutputSch;
import zenkit.web.dto.UpOutput;
import zenkit.web.vo.Project;

@Service
public class A02_OutputService {
	
	@Autowired(required=false)
	private A02_OutputDao dao;
	
	@Value("${upload}")
	String uploadPath;
	
	// 산출물 리스트
	public ArrayList<UpOutput> getOutput(OutputSch sch){
				
		ArrayList<UpOutput> outputs = dao.getOutputs(sch);
		
		for(UpOutput o : outputs) {
			// 빈 경로가 아니라면,
			if(o.getO_path()!= null) {
				// 경로 객체 생성
				Path p = Paths.get(o.getO_path());
				// 경로 중 파일 이름 추출
				String fname = p.getFileName().toString();
				// 이름 셋팅
				o.setF_name(fname);
			}
		}
		return outputs;
	}
	// 프로젝트 리스트
	public ArrayList<Project> getUserProList(int u_no){
		return dao.getUserProList(u_no);
	}
	
	// 산출물 갯수
	public int getUserOutCnt(OutputSch sch) {
		return dao.getUserOutCnt(sch);
	}
	
	
	// 산출물 등록
	public void regOutput(UpOutput output, MultipartFile o_file){
		
		// 파일 이름
		String filename = o_file.getOriginalFilename();
		
		// 등록할 파일이 있을 시
		if(filename != null && !filename.equals("")) {
			
			// 등록된 산출물 PK (o_no)
			
			String o_no = "o_"+ Integer.toString(dao.getMaxNo()+1);
			String p_no = "p_"+output.getP_no();
			// 파일 경로 생성(웹경로, 실제경로)
			String upPath = uploadPath + File.separator + "output" + File.separator + p_no + File.separator + o_no;
			String dbPath = File.separator+"output"+File.separator+p_no+File.separator+o_no+File.separator+filename;
			
			File realSavePath = new File(upPath); // 물리적 경로
			
			System.out.println("upPath"+upPath);
			System.out.println("dbPath"+dbPath);
			
			// 업로드하기 위한 경로가 없을 경우 디렉토리 생성
			if(!realSavePath.exists())
				realSavePath.mkdirs();
			
			try {
				
				// 경로에 해당파일 저장
				upPath += File.separator + filename;
				File saveFile = new File(upPath);
				o_file.transferTo(saveFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			// 데이터베이스 업데이트(파일경로)
			output.setO_path(dbPath);
		}
		
		// null값인 항목 처리
		String o_path = output.getO_path();
		String o_content = output.getO_content();
		if(o_path == null)
			output.setO_path("");
		if(o_content == null)
			output.setO_content("");
		
		// db저장
		dao.regOutput(output);
	}
	
	// 산출물 삭제
	public void delOutput(UpOutput output) {
		dao.delOutput(output);
	}
}
