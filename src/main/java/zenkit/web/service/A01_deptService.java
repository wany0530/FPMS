package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_deptDao;
import zenkit.web.dao.A01_userDao;
import zenkit.web.vo.Department;

@Service
public class A01_deptService {

	@Autowired(required = false)
	A01_deptDao deptDao;
	
	@Autowired(required = false)
	A01_userDao userDao;
	
	public ArrayList<Department> getDeptList(){
		return deptDao.getDeptList();
	}
	
	public void insertDept(Department dept) {
		deptDao.insertDept(dept);
	}
	
	public void deleteDept(String d_name) {
		// 삭제전 부서 변경
		userDao.userDeptUp(d_name);
		deptDao.deleteDept(d_name);
	}
}
