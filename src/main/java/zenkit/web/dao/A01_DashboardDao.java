package zenkit.web.dao;
import java.util.ArrayList;

// zenkit.dao.DashBoardDao 
import org.springframework.stereotype.Repository;

import zenkit.web.vo.DashBoard;

@Repository
public interface A01_DashboardDao {
	
	// 개인 대시보드 작업물 개수
	public int jobCnt(int u_no);	
	
	// 개인 대시보드 프로젝트 개수
	public int projectCnt(int u_no);
	
	// 개인 대시보드 프로젝트 개수
	public int outputCnt(int u_no);	
	
	// 개인 대시보드 프로젝트 별 기간
	public ArrayList<DashBoard> projectDate(int u_no);
		
	// 개인 대시보드 프로젝트 리스트
	public ArrayList<DashBoard> projectList(int u_no);

	
}


