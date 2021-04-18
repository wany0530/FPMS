package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.MyTaskSch;
import zenkit.web.vo.Auth;
import zenkit.web.vo.JobInfo;

@Repository
public interface A02_MyTaskDao {
	public int totCnt(MyTaskSch sch);
	public ArrayList<JobInfo> myTaskList(MyTaskSch sch);
	public ArrayList<String> myPros(int u_no);
	public void insertAuth(Auth ins);

}
