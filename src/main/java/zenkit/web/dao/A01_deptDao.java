package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.Department;

@Repository
public interface A01_deptDao {
	public ArrayList<Department> getDeptList();
	public void insertDept(Department dept);
	public void deleteDept(String d_name);
}
