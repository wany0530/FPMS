package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.Risk;



@Repository
public interface A03_riskDao {
  public ArrayList<Risk> riskList(Risk sch);
  public void riskInsert(Risk insert);
  public Risk getRisk(int r_no);
  public void updateRisk(Risk upt);
  public void deleteRisk(int r_no);
}