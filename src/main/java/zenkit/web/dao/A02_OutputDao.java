package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.OutputSch;
import zenkit.web.dto.UpOutput;
import zenkit.web.vo.Project;

@Repository
public interface A02_OutputDao {
	// 회원의 참여한 프로젝트의 작업에 대한 산출물 리스트 조회
	public ArrayList<UpOutput> getOutputs(OutputSch sch);
	// 프로젝트 리스트
	public ArrayList<Project> getUserProList(int u_no);
	// 산출물 갯수
	public int getUserOutCnt(OutputSch sch);
	// 산출물 등록
	public void regOutput(UpOutput output);
	// 산출물 o_no 얻기
	public int getMaxNo();
	// 산출물 삭제
	public void delOutput(UpOutput output);
}
