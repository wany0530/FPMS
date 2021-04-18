package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import zenkit.web.dao.A03_defaultInfoDao;
import zenkit.web.vo.A03_ProInfo;
import zenkit.web.vo.Department;
import zenkit.web.vo.User;

@Repository
public class A03_defaultInfoService {

	@Autowired(required=false)
	private A03_defaultInfoDao dao;
	
	public A03_ProInfo proInfo(int p_no) {
		return dao.proInfo(p_no);
	}
	public void uptProInfo(A03_ProInfo upt) {
		dao.uptProInfo(upt);
	}
	public void delproInfo(int p_no) {
		dao.delproInfo(p_no);
	}
	public ArrayList<Department> getDepartments(){
		return dao.getDepartments();
	}
	public ArrayList<User> getUser(int d_no){
		return dao.getUser(d_no);
	}
}
