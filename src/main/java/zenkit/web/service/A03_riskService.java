package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A03_riskDao;
import zenkit.web.vo.Risk;

@Service
public class A03_riskService {
@Autowired(required=false)
 private A03_riskDao dao;
public ArrayList<Risk> riskList(Risk sch){
  
   return  dao.riskList(sch);
}

public void riskInsert(Risk insert) {
	dao.riskInsert(insert);
}
public Risk getRisk(int r_no) {
	Risk risk=dao.getRisk(r_no);
	return risk;
}

public void updateRisk(Risk upt) {
	// TODO Auto-generated method stub
	dao.updateRisk(upt);
}

public void deleteRisk(int r_no) {
	dao.deleteRisk(r_no);
}
}