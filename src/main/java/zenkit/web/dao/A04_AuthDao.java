package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.dto.AuthSch;
import zenkit.web.vo.AuthInfo;
import zenkit.web.vo.Job;
import zenkit.web.vo.Output;

// zenkit.web.dao.A04_AuthDao

@Repository
public interface A04_AuthDao {
	public ArrayList<AuthInfo> authListPm(AuthSch sch);
	public ArrayList<AuthInfo> authList(AuthSch sch);
	public int totCnt(AuthSch sch);
	public ArrayList<String> getPmPros(int u_no);
	public ArrayList<String> getPros(int u_no);
	public Job getJobInfo(int j_no);
	public AuthInfo getAuthInfo(int a_no);
	public ArrayList<Output> getOutputInfo(int j_no);
	public void chRetire(int a_no);
	public void chAppRej(AuthInfo upt);
	public void chJobComple(Job upt);
	
//	public ArrayList<String> getPros(int u_no);
}
