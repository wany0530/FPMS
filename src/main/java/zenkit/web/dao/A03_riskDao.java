package zenkit.web.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import zenkit.web.vo.Project;
import zenkit.web.vo.Risk;
import zenkit.web.vo.RiskAction;

import zenkit.web.vo.User;



@Repository
public interface A03_riskDao {
  public ArrayList<Risk> riskList(Risk sch);
  public void riskInsert(Risk insert);
  public Risk getRisk(int r_no);
  public void updateRisk(Risk upt);
  public void deleteRisk(int r_no);
  public ArrayList <RiskAction> riskactionList(int r_no);
  //리스크 리스트 프로젝트 불러오기
  public ArrayList <Project> getProjects(int u_no);
  //리스크 이름 불러오기
  public int getPMNumber(int r_no);
  //상세에서 조치사항 쪽 select문인데 거기서 프로젝트에 참가하는 사람 수를 고르게 하고 싶었음.
  //어떤 VO를 써야 하는 것인가 가져온 항목은 User!! 그러니 User
  public ArrayList<User> getUsers(int p_no);
  //p_no로 찾을 것이기 때문이다
  
  //조치내용 인서트!!
  public void riskActionInsert(RiskAction insert);
  
  //리스크 상태 업데이트
  public void uptRiskState(Risk upt);
 
}


