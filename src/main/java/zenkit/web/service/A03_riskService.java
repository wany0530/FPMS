package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A03_riskDao;
import zenkit.web.dto.UpRisk;
import zenkit.web.vo.Project;
import zenkit.web.vo.Risk;
import zenkit.web.vo.RiskAction;

import zenkit.web.vo.User;

@Service
public class A03_riskService {
	
	@Autowired(required=false)
	private A03_riskDao dao;

	public ArrayList<Risk> riskList(UpRisk sch){
		if(sch.getR_name()==null) sch.setR_name("");
		
		if(dao.totCnt(sch)>0) {
			sch.setCount(dao.totCnt(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(10);
			}
			sch.setPageCount((int) Math.ceil(sch.getCount()/(double) sch.getPageSize()));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage()>sch.getPageCount()) { 
				sch.setCurPage(sch.getPageCount());
			}
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			
			sch.setBlockSize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
			int endBlock = blocknum*sch.getBlockSize();
			sch.setEndBlock(endBlock>sch.getPageCount() ? sch.getPageCount():endBlock);
			sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		}
	  
	   return  dao.riskList(sch);
	}

	public void riskInsert(Risk insert) {
		insert.setR_receive(dao.getPmId(insert.getP_no()));
		dao.riskInsert(insert);
	}
	
	public Risk getRisk(int r_no) {
		Risk risk=dao.getRisk(r_no);
		return risk;
	}
	
	public ArrayList <RiskAction> getactionList(int r_no){
		return dao.riskactionList(r_no);
	}
	
	/*등록 시 프로젝트 셀렉트  public ArrayList <Project> getProjects(int u_no);*/
	public ArrayList <Project> getProjects(int u_no){
		return dao.getProjects(u_no);
	}
	
	//프로젝트 참가 인원 수 구하기  public ArrayList<User> getUsers(int p_no)
	public ArrayList<User> getUsers(int p_no){
		return dao.getUsers(p_no);
	}
	
	//리스크서비스 이름으로 가져오기
	public int getPMNumber(int r_no) {
	   return dao.getPMNumber(r_no);
	}
	
	
	public void updateRisk(Risk upt) {
		// TODO Auto-generated method stub
		dao.updateRisk(upt);
	}
	
	public void deleteRisk(int r_no) {
		dao.deleteRisk(r_no);
	}
	
	//조치내용 입력
	//public void riskActionInsert(RiskAction insert);
	public void riskActionInsert(RiskAction insert) {
		dao.riskActionInsert(insert);
	}
	
	//리스크 상태 업데이트
	public void uptRiskState(Risk upt) {
		dao.uptRiskState(upt);
	}
}