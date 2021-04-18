package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.Calendar2;

@Repository
public interface A02_CalenDao {
	public ArrayList<Calendar2> calenList(int u_no);
	public void insertCalendar(Calendar2 ins);
	public void updateCalen(Calendar2 upt);
	public void deleteCalen(int id);
}
