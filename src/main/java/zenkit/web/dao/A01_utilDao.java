package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.Department;
import zenkit.web.vo.Position;
import zenkit.web.vo.Rank;

@Repository
public interface A01_utilDao {
	public ArrayList<Department> getDeptList();
	public ArrayList<Position> getPosList();
	public ArrayList<Rank> getRankList();
}
