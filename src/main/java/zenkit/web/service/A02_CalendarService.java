package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import zenkit.web.dao.A02_CalenDao;
import zenkit.web.vo.Calendar2;
@Repository
public class A02_CalendarService {
	@Autowired(required=false)
	private A02_CalenDao dao;
	
	public ArrayList<Calendar2> calenList(int u_no){
		return dao.calenList(u_no);
	}
	
	public void insertCalendar(Calendar2 ins) {
		dao.insertCalendar(ins);
	}
	public void updateCalen(Calendar2 upt) {
		dao.updateCalen(upt);
	}
	public void deleteCalen(int id) {
		dao.deleteCalen(id);
	}
}
