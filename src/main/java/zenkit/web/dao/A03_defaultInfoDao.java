package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.A03_ProInfo;
import zenkit.web.vo.Department;
import zenkit.web.vo.User;

@Repository
public interface A03_defaultInfoDao {
	
	public A03_ProInfo proInfo(int p_no);
	public void uptProInfo(A03_ProInfo upt);
	public void delproInfo(int p_no);
	public ArrayList<Department> getDepartments();
	public ArrayList<User> getUser(int d_no);
}
