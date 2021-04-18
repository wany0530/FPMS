package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A01_utilDao;
import zenkit.web.vo.Department;
import zenkit.web.vo.Position;
import zenkit.web.vo.Rank;

@Service
public class A01_utilService {
	
	@Autowired
	A01_utilDao dao;
	
	public ArrayList<Department> getDeptList(){
		return dao.getDeptList();
	}
	public ArrayList<Position> getPosList(){
		return dao.getPosList();
	}
	public ArrayList<Rank> getRankList(){
		return dao.getRankList();
	}
}
